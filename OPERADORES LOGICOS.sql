--OPERADORES LOGICOS(BETWEEN, LIKE, EXISTS)

--SELECT 
--	[e].employee_name,
--	[e].employee_lastname,
--	[e].employee_birthday,
--	[e].employee_gender,
--	[e].employee_salary,
--	[e].employee_positionName,
--	[e].employee_crearedDate

--FROM 
--	[dbo].[Employees] AS [e]

--WHERE
--	--employee_salary BETWEEN 500 AND 600
--	--employee_birthday BETWEEN '01-01-1990' AND '12-31-1993'
--	--employee_lastname LIKE 'R%' --INICIA CON LA LETRA
--	--employee_lastname LIKE '%rA' --TERMINA CON LA LETRA
--	--employee_name LIKE '%S%' --CONTENGAN  LA LETRA
--	--employee_lastname LIKE '%_LI_D%' --CARACTER AL INICIO O AL FIN
--	--employee_lastname LIKE '%[DA]%' --DELIMITA UN CARACTER DE UNA LISTA
--	--employee_lastname LIKE '%[A-F]%' --DELIMITA VARIOS POR UN LISTA DE LA A A LA F
--	--employee_lastname LIKE '[zs]AVALETA' --DELIMITA POR VARIAS OPCIONES (OR)
--	--employee_lastname LIKE '%[^lp]' --DISCRIMINA LOS VALORES CONTENIDOS DENTRO DEL CORCHETE
--	--(employee_lastname LIKE 'R%' AND employee_salary <500)
--	--OR
--	--	employee_gender =1

--	--employee_positionName LIKE '?_%' ESCAPE '?' --palabras reservadas dentro del string
	
--	(EXISTS
--		(
--		SELECT [d].department_id
--		FROM [dbo].[Departments] as [d]
--		WHERE [d].department_id = [e].department_id AND [d].department_id in(2,3)
--		)
--	);





--UPDATE [dbo].[Employees]
--SET [employee_positionName] = '_Incidencias'
--WHERE [employee_id] =20