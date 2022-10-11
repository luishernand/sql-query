--Funciones de FECHA y HORA 
--hIGGER PRESITION
--SELECT SYSDATETIME()
--SELECT SYSDATETIMEOFFSET()
--SELECT SYSUTCDATETIME()

--LOWER 
--SELECT GETDATE()
--SELECT CURRENT_TIMESTAMP
--SELECT GETUTCDATE()

--GET PART OF DATE
--SELECT DATEPART(YEAR, GETDATE())
--SELECT DATEPART(YEAR,[employee_birthday]) FROM [dbo].[Employees]
--SELECT DATEPART(YEAR, '2018-01-01')
--SELECT DATEPART(MONTH, '2018-01-01')
--SELECT DATEPART(MONTH,[employee_birthday]) FROM [dbo].[Employees]

--SELECT DATEPART(DAY, '2018-01-01')
--SELECT DATEPART(DAY,[employee_birthday]) FROM [dbo].[Employees]

--SELECT DATENAME(MONTH, '2018-01-01')
--SELECT DATENAME(MONTH,[employee_birthday]) FROM [dbo].[Employees]
--SELECT DATENAME(WEEK,[employee_birthday]) FROM [dbo].[Employees]
--SELECT DATENAME(WEEKDAY,[employee_birthday]) FROM [dbo].[Employees]

--GET DIFFERENCES VALUES FROM
--SELECT DATEDIFF(YEAR, '2016-01-10', '2021-06-16') AS 'DiasTrans'

--SELECT 
--	[e].employee_name + ' ' + [e].employee_lastname AS 'FullName'
--	, DATEDIFF(YEAR,[e].employee_birthday, [e].employee_crearedDate) AS 'Time'
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE 
--	DATEDIFF(YEAR,[e].employee_birthday, [e].employee_crearedDate)=26;


---SELECT 
--	[e].employee_name + ' ' + [e].employee_lastname AS 'FullName'
--	, DATEDIFF(YEAR,[e].employee_birthday, [e].employee_crearedDate) AS 'Time'
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE 
--	DATEDIFF(YEAR,[e].employee_birthday, [e].employee_crearedDate)=26;

--SELECT DATEDIFF_BIG(NANOSECOND,GETDATE()-5, GETDATE())

--MODIFY DATA
--SELECT GETDATE() - 5
--SELECT DATEADD(YEAR,-5, GETDATE())

--SELECT EOMONTH([employee_birthday]) FROM [dbo].[Employees]

--VALIDATION
--SELECT ISDATE('ADV') AS 'VALIDATION'