/*
Queries used for Tableau Project
*/

--1. 
SELECT
	SUM(new_cases) AS TotalCases, 
	SUM(CONVERT(int, new_deaths)) AS TotalNewDeaths,
	SUM(CONVERT(int, new_deaths))/SUM(new_cases)*100 AS DeathPercentage
	
FROM [dbo].[CovidDeaths] 
WHERE continent IS NOT NULL


--2 
SELECT
	continent, 
	SUM(CONVERT(INT, [new_deaths])) AS TotalDeathsCount
	
FROM 
	[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY continent


--3. 
SELECT
	location, 
	population,
	MAX([total_cases]) as HighestInfection,
	MAX(([total_cases]/population))* 100 AS PercentPopulation
	
FROM 
	[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL
--AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location, population


--4. 
SELECT
	location, 
	population,
	[date],
	MAX([total_cases]) as HighestInfection,
	MAX(([total_cases]/population))* 100 AS PercentPopulation
	
FROM 
	[dbo].[CovidDeaths] 
WHERE continent IS NOT NULL
--AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location, population, date