--Examen SQL Asociacion Popular

--Creacion de tablas

	--CREATE TABLE [dbo].[empleados]
	--(
	--	[ID_empleados] INT  NOT NULL IDENTITY(1,1)
	--	, [Nombre] VARCHAR(100) NOT NULL
	--	, [DNI] VARCHAR(9) NOT NULL
	--	, [Sueldo] DECIMAL(18,2) NOT NULL
	--)

--CREATE TABLE [dbo].[Codigos_postales]
--	(
--		[ID_Codigo_postal] INT  NOT NULL IDENTITY(1,1)
--		, [Codigo_postal] int NOT NULL
--		, [Poblacion] VARCHAR(100) NOT NULL
--		, [Provincia] VARCHAR(100) NOT NULL
--	)

--CREATE TABLE [dbo].[Telefonos]
--	(
--		[ID_telefonos] INT  NOT NULL IDENTITY(1,1)
--		, [DNI] VARCHAR(9) NOT NULL
--		, [Telefono] INT
	
--	)


--CREATE TABLE [dbo].[Domicilios]
--	(
--		[ID_domicilios] INT  NOT NULL IDENTITY(1,1)
--		, [DNI] VARCHAR(9) NOT NULL
--		, [calle] VARCHAR(100) NOT NULL
--		, [Codigo_postal] INT NOT NULL
--	)

----------Insertar los valores--------

--INSERT INTO [dbo].[empleados]
--([Nombre],[DNI], [Sueldo])

--VALUES
--	('Antonio Arjona', '12345678A', 5000)
--	,('Carlota Cerezo', '12345678C', 1000)
--	,('Laura López', '12345678L', 1500)
--	,('Pedro Pérez', '12345678P', 2000)

--INSERT INTO [dbo].[Telefonos]
--([DNI], [Telefono])

--VALUES
--	-- ('12345678C', 611111111)
--	--,('12345678C', 931111111)
--	--,('12345678L', 913333333)
--	--,('12345678P', 913333333)
--	,('12345678P', 644444444)

--INSERT INTO [dbo].[Codigos_postales]

--	([Codigo_postal],[Poblacion], [Provincia])

--VALUES
--		(08050, 'Parets','Barcelona')
--	,	(14200, 'Peñarroya','Córdoba')
--	,	(14900, 'lucena','Córdoba')
--	,	(28040, 'Madrid','Madrid')
--	,	(50008, 'Zaragoza','Zaragoza')
--	,	(28004, 'Arganda','Madrid')
--	,	(28000, 'Madrid','Madrid')


--INSERT INTO[dbo].[Domicilios]

--	([DNI],[calle],[Codigo_postal])

--VALUES
--		('12345678A', 'Avda. Complutense', 28040)
--	,	('12345678A', 'Cántaro',28004)
--	,	('12345678P', 'Diamante',15200)
--	,	('12345678P', 'Carbón',14900)
--	,	('12345678L', 'Diamante',14200)
	


--Listado de empleados que muestre Nombre, Calle y Código postal ordenados por Código postal y
--Nombre. En 2 formas diferentes:
--a) Con SELECT.
--b) Con JOIN

--SELECT 
--	e.Nombre
--	, d.Calle
--	, d.Codigo_postal
--FROM  
--	[dbo].[empleados] AS [e]
--	INNER JOIN [dbo].[Domicilios] AS [d]
--		ON e.DNI = d.DNI
--ORDER BY 
--	d.Codigo_postal ASC



--SELECT * FROM [dbo].[empleados]
--SELECT * FROM [dbo].[Telefonos]

--SELECT 
--	e.Nombre
--	, d.Calle
--	, d.Codigo_postal

--FROM 
--	[dbo].[empleados] AS [e]
--	, [dbo].[Domicilios] AS [d]

--WHERE
--	e.DNI = d.DNI
--ORDER BY d.Codigo_postal ASC

--Listado de los empleados ordenados por nombre que muestre Nombre, DNI, Calle, Código postal,
--Teléfono. En 2 formas diferentes:
--a) Sólo los empleados que tengan teléfono.
--b) Los empleados que tengan teléfono como los que no

--SELECT
--	e.Nombre
--	, e.DNI
--	, d.Calle
--	, d.[Codigo_postal]
--	, t.[Telefono]
--FROM 
--	[dbo].[empleados] AS e
--	LEFT JOIN [dbo].[Domicilios] AS d
--		ON e.DNI = d.DNI
--	INNER JOIN [dbo].[Telefonos] AS t
--		ON e.DNI = t.DNI
--ORDER BY e.Nombre

--SELECT
--	e.Nombre
--	, e.DNI
--	, d.Calle
--	, d.[Codigo_postal]
--	, t.[Telefono]
--FROM 
--	[dbo].[empleados] AS e
--	LEFT JOIN [dbo].[Domicilios] AS d
--		ON e.DNI = d.DNI
--	LEFT JOIN [dbo].[Telefonos] AS t
--		ON e.DNI = t.DNI
--ORDER BY e.Nombre


--SELECT 
--	e.[Nombre]
--	,e.[DNI]
--	, d.[calle]
--	,d.[Codigo_postal]
--	, cp.[Poblacion]
--	, cp.[Provincia]
--FROM 
--	[dbo].[empleados] as e
--	INNER JOIN [dbo].[Domicilios] as d
--		ON  e.DNI = d.DNI
--	INNER JOIN [dbo].[Codigos_postales] as cp
--		ON d.[Codigo_postal] = cp.[Codigo_postal]
--ORDER BY
--	e.Nombre ASC 


--Incrementar en un 10% el sueldo de todos los empleados, de forma que el sueldo aumentado
--no supere en ningún caso 1.900.--SELECT --	[e].Nombre--	,[e].Sueldo--FROM [dbo].[empleados] AS [e]--WHERE --	[e].Sueldo <=1600;--UPDATE [dbo].[empleados]--SET Sueldo = Sueldo * 1.1--WHERE --	Sueldo <=1600;--UPDATE [dbo].[empleados]--SET Sueldo = Sueldo / 1.1--WHERE --	Sueldo <=1600;--SELECT --	COUNT(Nombre) as 'Total de Empleados'--	, MAX(Sueldo) as 'Maximo'--	, MIN(Sueldo) as 'Minimo'--	, AVG(Sueldo) as 'Medio'--FROM [dbo].[empleados]--SELECT --	AVG(e.Sueldo) AS 'Sueldo Medio'--	, cp.[Poblacion]--FROM --	[dbo].[empleados] AS e--	LEFT JOIN [dbo].[Domicilios] AS d--		ON e.DNI = d.DNI--	LEFT JOIN  [dbo].[Codigos_postales] AS cp--		ON  d.[Codigo_postal] = cp.[Codigo_postal]--GROUP BY --	cp.[Poblacion]--ORDER BY cp.[Poblacion]--SELECT --	*--FROM--	(--		SELECT --			e.Sueldo as Sueldo--			, cp.[Poblacion] AS poblacion--			, cp.[Provincia] AS provincia--		FROM --			[dbo].[empleados] AS e--			LEFT JOIN [dbo].[Domicilios] AS d--				ON e.DNI = d.DNI--			LEFT JOIN  [dbo].[Codigos_postales] AS cp--				ON  d.[Codigo_postal] = cp.[Codigo_postal]--		--GROUP BY --		--	cp.[Poblacion]--		--	,cp.[Provincia]--		--ORDER BY cp.[Poblacion]--	) --PIVOT--	(--	AVG(e.[Sueldo]) --	FOR cp.[Poblacion]--	--IN --	--	cp.[Poblacion]--	)