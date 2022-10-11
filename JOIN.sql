
--JOIN---



--SELECT * FROM [dbo].[Departments];



--SELECT [e].[employee_name], [d].department_name FROM [dbo].[Employee] AS [e]
--INNER JOIN [dbo].[Departments] AS [d]
--ON [e].[department_id] = [d].[department_id];



--SELECT [e].[employee_name], [d].department_name FROM [dbo].[Employee] AS [e]
--LEFT JOIN [dbo].[Departments] AS [d]
--ON [e].[department_id] = [d].[department_id]
--WHERE 
--	[d].department_id IS NOT NULL;


--SELECT [e].[employee_name], [d].department_name FROM [dbo].[Employee] AS [e]
--RIGHT JOIN [dbo].[Departments] AS [d]
--ON [e].[department_id] = [d].[department_id]
--WHERE
--[e].[department_id] IS NOT  NULL;

--SELECT [e].[employee_name], [d].department_name FROM [dbo].[Employee] AS [e]
--FULL OUTER JOIN [dbo].[Departments] AS [d]
--ON [e].[department_id] = [d].[department_id];