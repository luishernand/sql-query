--SUM 
--SELECT 
--	--[pod].PurchaseOrderID
--	,SUM([OrderQty]) as [totalpurchasing]
--FROM 
--	[Purchasing].[PurchaseOrderDetail] as [pod]
----GROUP BY 
----	[pod].PurchaseOrderID

--SELECT 
--	--[pod].PurchaseOrderID
--	--,SUM([OrderQty]) as [totalpurchasing]
--	SUM([pod].[LineTotal]) as 'Totalline'
--FROM 
--	[Purchasing].[PurchaseOrderDetail] as [pod]
--GROUP BY 
--	[pod].PurchaseOrderID


--2. COUNT
--SELECT 
	 
--	--*
--	--COUNT([BusinessEntityID]) as [campo_no_nulo]
--	--,COUNT([TerritoryID]) as [campo_nulo]
--	--COUNT(*) AS [total_registros]
--FROM [Sales].[SalesPerson]


--SELECT 
--	--* 
--	COUNT(DISTINCT[VendorID] )
--FROM 
--	[Purchasing].[PurchaseOrderHeader]


--MIN AND MAX AND AVG 
--SELECT 
--	--*
--	AVG([pod].UnitPrice) as 'Promedio'
--	,[PurchaseOrderID]
--	--,COUNT(*) AS 'TOTAL DE lINEA'
--	--,MIN([pod].UnitPrice) as 'Precio minimo'
--	--,MAX([pod].UnitPrice) as 'Precio maximo'
--FROM 
--	[Purchasing].[PurchaseOrderDetail] as [pod]
----WHERE 
----	[PurchaseOrderID] = 515

--GROUP BY 
--	[PurchaseOrderID]


--COMPROBACION--
--SELECT TOP(1)
--	[pod].UnitPrice
--FROM 
--	[Purchasing].[PurchaseOrderDetail] as [pod]
--ORDER BY [pod].UnitPrice DESC


--SELECT 
--	--* 
--	AVG([UnitPrice]) AS 'PORMEDIO'
--FROM 
--	[Purchasing].[PurchaseOrderDetail]
--WHERE 
--	PurchaseOrderID = 29

--SELECT (38/5)
--SELECT 38 % 5 

--SELECT 
--	[ProductID] 
--	, SUM([OrderQty]) as 'Cantidad'
--	, SUM([OrderQty]) /100  AS 'Box a surtir'
--	, SUM([OrderQty])  % 100  AS 'Piezas sobrantes'

--FROM 
--	[Purchasing].[PurchaseOrderDetail]
--WHERE 
--	[OrderQty]>=100

GROUP BY
	[ProductID]
ORDER BY
	[ProductID]


