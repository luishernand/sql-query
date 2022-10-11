SELECT 
	[e].employee_name,
	[e].employee_lastname,
	[e].employee_name + ' ' + [e].employee_lastname AS [employee_fullName],
	CONCAT([e].employee_name,' ', [e].employee_lastname) AS [employee_names1],
	[e].employee_positionName,
	[e].employee_salary,
	[e].employee_crearedDate,
	[d].department_name,
	[d].department_name + ' / ' + [e].employee_name AS [employee_position],
	[e].employee_name + '/' + [d].department_name + ' / ' + CAST([e].employee_salary AS varchar(100)) AS [emploeyye_salary_name_departmen]


FROM 
	[dbo].[Employees] AS [e]

INNER JOIN 
	[dbo].[Departments] AS [d]
	ON 
		[e].department_id = [d].department_id
	

ORDER BY 
		[employee_names1] DESC