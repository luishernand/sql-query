--SELECT * FROM [dbo].[Departments]
--SELECT * FROM [dbo].[Employees]

SELECT 
	d.department_name
	, SUM(e.[employee_salary]) AS 'Salario'
	, COUNT(e.[employee_id]) AS 'Cantidad'
FROM 
	[dbo].[Departments] AS [d]
	INNER JOIN  [dbo].[Employees] AS [E]
		ON e.department_id = d.department_id
GROUP BY
	d.department_name
HAVING 
	COUNT(e.[employee_id]) <=5
	AND SUM(e.[employee_salary]) >= 2000

