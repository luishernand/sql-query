--1. LENGTH
--SELECT SUBSTRING('SQL SERVER DESDE CERO',5,6) AS 'EXTRACCION'

--SELECT 
--	SUBSTRING(employee_positionName, 1,5) AS 'EXTRACCION'
--FROM 
--	[dbo].[Employees]

--SELECT LEFT('123456879',6)
--SELECT RIGHT('PO-000001',6)

--SELECT 
--	RIGHT(employee_birthday,2) 
--FROM 
--	[dbo].[Employees]

--SELECT LEN('SQL SERVER DESDE CERO') AS 'SIZE'

--2. ALTERATION
--SELECT REPLACE('SQL SERVER','SQL','ORACLE') AS 'REPLACEMENT'

--SELECT 
--	REPLACE([measure_description], 'Pieza','Nueva medida') as 'REPLACEMENT'
--FROM 
--	[dbo].[Measures]

--SELECT REPLICATE('LUIS ',10)

--SELECT CHARINDEX('.', 'luish@gmail.com')
--SELECT STUFF('luish@gmail.com', 1,5, 'confidencial')

--3. FORMATING
--SELECT LOWER([employee_name]) AS 'LOWER' FROM Employees 
--SELECT UPPER([employee_name])  AS 'UPPER' FROM Employees 

--SELECT RTRIM(' LUIS HERNANDEZ ')
--SELECT LTRIM(' LUIS HERNANDEZ ')
--SELECT TRIM(' LUIS HERNANDEZ ')

--SELECT FORMAT(employee_id,'D5') FROM Employees

--splitting
--SELECT VALUE FROM string_split('piña,manzana,guineo,melo,pera',',')