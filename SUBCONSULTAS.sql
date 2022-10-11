--subconsultas; puede repercutir en el performace

--SUBCONSULTA DE TIPO COLUMNA
--SELECT 
--	[soh].SalesOrderID
--	, [soh].OrderDate
--	, (
--	SELECT MAX([sod].[UnitPrice])
--	FROM [Sales].[SalesOrderDetail] AS [sod]
--	WHERE [soh].SalesOrderID = [sod].SalesOrderID
--	) AS [MaxUnitprice]
--FROM 
--	[Sales].[SalesOrderHeader] AS [soh];

--Obtener el mismo resultado pero mejor OPTIMISADO con join 
--SELECT 
--	[soh].SalesOrderID
--	, [soh].OrderDate
--	, MAX([sod].[UnitPrice])
--FROM 
--	[Sales].[SalesOrderHeader] AS [soh]
--	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
--	 ON [soh].SalesOrderID = [sod].SalesOrderID
--GROUP BY 
--	[soh].SalesOrderID
--	, [soh].OrderDate;

--TIPO JOIN
--SELECT 
--	[el].[BusinessEntityID]
--	,[el].LoginID
--	,[el].JobTitle
--	,[el].VacationHours
	
--FROM 
--	[HumanResources].[Employee] AS [el]
--	INNER JOIN
--	(SELECT 
--	[e2].JobTitle
--	, AVG([e2].VacationHours) as [AverageVacation]
--	 FROM 
--		[HumanResources].[Employee] AS [e2]
--	GROUP BY
--		[e2].JobTitle
--		) AS [SUB]
--		ON	[el].JobTitle = [SUB].JobTitle
--WHERE
--	[el].VacationHours = [SUB].[AverageVacation]
--ORDER BY
--	[el].JobTitle

----245--58--

--;WITH CTE_VacationAVG AS
--(
--	SELECT
--		[e2].[JobTitle]
--		,AVG([e2].[VacationHours]) AS [AverageVacation]
--	FROM 
--		[HumanResources].[Employee] AS [e2]
--	GROUP BY 
--		[e2].[JobTitle]
--)
--SELECT 
--	[el].[BusinessEntityID]
--	,[el].LoginID
--	,[el].JobTitle
--	,[el].VacationHours
--	,cte.AverageVacation
	
--FROM 
--	[HumanResources].[Employee] AS [el]
--	INNER JOIN [CTE_VacationAVG] AS [cte]
--	ON [el].JobTitle =[cte].JobTitle
--WHERE
--	el.VacationHours > cte.AverageVacation
--ORDER BY
--	[el].JobTitle

--where

--SELECT 
--	soh.SalesOrderNumber,
--	soh.OrderDate
--	, soh.TotalDue
--	, soh.CustomerID
--	, sod.ProductID
--	, sod.OrderQty
--	,sod.UnitPrice
--FROM 
--	[Sales].[SalesOrderHeader] AS soh
--	INNER JOIN [Sales].[SalesOrderDetail] AS sod
--	ON  soh.SalesOrderID = sod.SalesOrderID
--WHERE
--	sod.ProductID
--	IN (
--	SELECT 
--		ProductID
		
--	FROM
--		[Production].[Product] as p
--	WHERE
--		p.MakeFlag =1
--	);

--SOLUCION 1
--SELECT 
--	soh.SalesOrderNumber,
--	soh.OrderDate
--	, soh.TotalDue
--	, soh.CustomerID
--	, sod.ProductID
--	, sod.OrderQty
--	,sod.UnitPrice
--FROM 
--	[Sales].[SalesOrderHeader] AS soh
--	INNER JOIN [Sales].[SalesOrderDetail] AS sod
--		ON  soh.SalesOrderID = sod.SalesOrderID
--	INNER JOIN [Production].[Product] as p
--		ON  sod.ProductID = p.ProductID
--		AND p.MakeFlag =1

--SOLUCION 2
--SELECT 
--	soh.SalesOrderNumber,
--	soh.OrderDate
--	, soh.TotalDue
--	, soh.CustomerID
--	, sod.ProductID
--	, sod.OrderQty
--	,sod.UnitPrice
--FROM 
--	[Sales].[SalesOrderHeader] AS soh
--	INNER JOIN [Sales].[SalesOrderDetail] AS sod
--		ON  soh.SalesOrderID = sod.SalesOrderID
--	INNER JOIN [Production].[Product] as p
--		ON  sod.ProductID = p.ProductID
		
		
--WHERE 
--	p.MakeFlag =1;

