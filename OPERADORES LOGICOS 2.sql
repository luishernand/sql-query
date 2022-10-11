--OPERADORES LOGICOS
--AND, OR, NOT, IN

--SELECT 
--	* 
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	[e].employee_salary >=300
--	AND  [e].employee_salary <=500
--	AND [e].department_id =3
--	AND [e].employee_gender = 1
--ORDER BY [e].employee_salary ASC


--SELECT 
--	* 
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	[e].department_id = 1
--	OR 
--	[e].department_id = 2
--	OR 
--	[e].department_id = 3
--ORDER BY [e].employee_id ASC


--SELECT 
--	* 
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	[e].employee_positionName  IN('Ayudante General','Supervisor')
	
--ORDER BY [e].employee_salary ASC

--SELECT 
--	* 
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	[e].department_id   NOT IN(1,2,3)
	
--ORDER BY [e].employee_id ASC

--SELECT 
--	* 
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	(
--	[e].employee_salary <=500
--	AND 
--	[e].employee_gender =1
--	)
--	OR 
--	(
--	[e].department_id  IN(4,5)
--	)	
--ORDER BY [e].department_id ASC