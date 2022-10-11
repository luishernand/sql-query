SELECT
	--DISTINCT [d].department_name
	*
FROM 
	[dbo].[Employees] AS [e]
	INNER JOIN [dbo].[Departments] AS [d]
		ON	[e].department_id = [d].department_id