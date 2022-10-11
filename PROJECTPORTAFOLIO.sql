/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

-- Select data that we are going to starting with
Select *
From PortafolioProject..CovidDeaths
where continent is not null
order by 3,4

Select location, date, total_cases, new_cases, total_deaths
From PortafolioProject..CovidDeaths
where continent is not null
order by 1,2

-- Total Cases Vs TotalDeaths
-- Hows likelihood of dying if you covid in your country

Select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
From PortafolioProject..CovidDeaths
where continent is not null
and  location  like'%Dominican Republic%'
order by 1

--Total Cases vs population
-- shows what percentage of population infected with covid

Select location, date, total_cases, population,  (total_cases/population) * 100 as DeathPercentage
From PortafolioProject..CovidDeaths
where continent is not null
and  location  like'%Dominican Republic%'
order by 4 desc


--Countries with Highest Infection rate Compared to populations

Select location, population, MAX(total_cases)  as HighestInfections, 
MAX((total_cases/population)) * 100as PercentagePopulationInfected
From PortafolioProject..CovidDeaths
where continent is not null
--and  location  like'%Dominican Republic%'
group by location, population
order by 3 desc

--Contries with highest Death count per population
Select  location, population, max(cast(total_deaths as int)) as TotalDEaths
From [dbo].[CovidDeaths]
where location is not null
and location  like'%Dominican Republic%'
group by location, population
order by 3 desc

-- breaking things with continet
--showing continents with the highest death count  per population

Select continent,  MAX(cast(total_deaths as int))  as TotalDeathsCounts
From PortafolioProject..CovidDeaths
where continent is not null
--and  location  like'%Dominican Republic%'
group by continent
order by 2 desc

-- GLOBAL NUMBERS
Select SUM(new_cases) as TotalNewCases, sum(cast(new_deaths as int)) TotalDeaths,
sum(cast(new_deaths as int)) / sum(new_cases) * 100 as DeathsPercentage
From PortafolioProject..CovidDeaths
where continent is not null
--and  location  like'%Dominican Republic%'
--group by continent
--order by 2 desc

--Total population vs vaccinations
--shows Percentage of population that recived at leats one Covid Vaccine

SELECT 
	[d].continent, 	d.location, 
	d.date, d.population, 
	v.new_vaccinations, SUM(convert(int, v.new_vaccinations)) over (Partition by d.location order by d.location, d.date) as 'RollingPeopleVacinned'
FROM PortafolioProject..CovidDeaths AS [d]
	join PortafolioProject..CovidVaccinations AS [v]
	on 	[d].[location] = [v].[location]
	and [d].[date] = [v].[date]
	
WHERE
	[d].continent is not null
ORDER BY
6 DESC

-- USE CTE TO PERFORMECALCULATION BY PREVIUS QUERY
with PopVac(continent, location, date, population,new_vaccinations, RollingPeopleVacinned)
as
(
SELECT 
	[d].continent, 	d.location, 
	d.date, d.population, 
	v.new_vaccinations, SUM(convert(int, v.new_vaccinations)) over (Partition by d.location order by d.location, d.date) as 'RollingPeopleVacinned'
FROM PortafolioProject..CovidDeaths AS [d]
	join PortafolioProject..CovidVaccinations AS [v]
	on 	[d].[location] = [v].[location]
	and [d].[date] = [v].[date]
	
WHERE
	[d].continent is not null
--ORDER BY
--6 DESC	
)

select *, (RollingPeopleVacinned/population) * 100 as 'PercentageVacc'
from PopVac
order by 6 desc

--Using temperal table
DROP Table if exists #PercentPopulationVacc
Create table #PercentPopulationVacc
(
	continent nvarchar(255),
	location nvarchar(255),
	date datetime,
	population numeric,
	new_vaccinations numeric,
	RollingPeopleVacinned numeric
)

insert into #PercentPopulationVacc
SELECT 
	[d].continent, 	d.location, 
	d.date, d.population, 
	v.new_vaccinations, SUM(convert(int, v.new_vaccinations)) over (Partition by d.location order by d.location, d.date) as 'RollingPeopleVacinned'
FROM PortafolioProject..CovidDeaths AS [d]
	join PortafolioProject..CovidVaccinations AS [v]
	on 	[d].[location] = [v].[location]
	and [d].[date] = [v].[date]

SELECT 
	*, (RollingPeopleVacinned/population) * 100 as 'PercentageVacc'
from #PercentPopulationVacc
where continent is not null
order by  6 desc

--Creating a view 
Create View PercentPopulationVacc as 
SELECT 
	[d].continent, 	d.location, 
	d.date, d.population, 
	v.new_vaccinations, SUM(convert(int, v.new_vaccinations)) over (Partition by d.location order by d.location, d.date) as 'RollingPeopleVacinned'
FROM PortafolioProject..CovidDeaths AS [d]
	join PortafolioProject..CovidVaccinations AS [v]
	on 	[d].[location] = [v].[location]
	and [d].[date] = [v].[date]
WHERE 
	d.continent IS NOT NULL


SELECT *  
FROM [dbo].[PercentPopulationVacc]
ORDER BY 1, 2