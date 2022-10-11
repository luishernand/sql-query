--UNION--> Devuelve filas distintas unicass 
--UNION --->	ALL Aparcen todas las filas repetidas 
--INTERSECT --> devuelve filas que en ambas consultas
--EXCEPT --> devuelve filas encontradas en el primer query


--SELECT 
--	[e].employee_name,
--	[e].employee_lastname,
--	[e].employee_salary,
--	[e].employee_positionName
	
	

--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	[e].employee_positionName LIKE '%Ventas%'

--EXCEPT

--SELECT
--	[e].employee_name,
--	[e].employee_lastname,
--	[e].employee_salary,
--	[e].employee_positionName
	
	
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	[e].employee_salary <=500;
