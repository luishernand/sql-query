SELECT 
	[e].employee_name,
	[e].employee_lastname,
	[e].employee_positionName,
	[e].employee_salary,
	[e].employee_crearedDate,
	[d].department_name

FROM 
	[dbo].[Employees] AS [e]

INNER JOIN 
		[dbo].[Departments] AS [d]
		ON 
			[e].department_id = [d].department_id
	

ORDER BY 
		[d].department_name DESC;
		
		
