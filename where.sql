--WHERE
--A Filtrado por un registro--
--SELECT 
--	* 
--FROM 
--	[Sales].[Store]
--WHERE 
--	[BusinessEntityID] = 304

--B Filtrado por contenido--
--SELECT 
--	* 
--FROM 
--	[Sales].[Store]
--WHERE 
--	[Name] LIKE '%Bikes%'

--SELECT 
--	* 
--FROM 
--	[Purchasing].[PurchaseOrderHeader]
--WHERE 
--	TaxAmt > = 1000 AND YEAR( [OrderDate]) = 2011

--SELECT 
--	* 
--FROM 
--	[Purchasing].[Vendor] as [v]
--WHERE 
--	[v].CreditRating = 1 
--	OR [v].ActiveFlag = 1
--	OR [v].AccountNumber LIKE 'W%'

--SELECT 
--	* 
--FROM 
--	[Purchasing].[Vendor] as [v]
--WHERE 
--	[v].CreditRating = 1
--	and [v].ActiveFlag =1
--	and [v].AccountNumber LIKE 'W%'



--SELECT 
--	* 
--FROM 
--	[Person].[Person]
--WHERE 
--	FirstName in ('Ken', 'Roberto', 'Gail')

--SELECT 
--	* 
--FROM 
--	[Sales].[SalesOrderDetail]
--WHERE 
--	UnitPrice BETWEEN 700 AND 900

--MULTIPLE JOIN
--SELECT 
--	[soh].SalesOrderNumber,
--	[soh].OrderDate,
--	[soh].TerritoryID,
--	[st].Name,
--	[st].CountryRegionCode,
--	[cr].Name,
--	[soh].ShipMethodID,
--	[sm].ShipRate,
--	[soh].TotalDue

	

--FROM 
--	[Sales].[SalesOrderHeader] AS [soh]
	
--	INNER JOIN [Sales].[SalesTerritory] AS [st]
--		ON [st].TerritoryID = [soh].TerritoryID
	
--	INNER JOIN [Person].[CountryRegion] AS [cr]
--		ON [st].CountryRegionCode = [cr].CountryRegionCode

--	INNER JOIN [Purchasing].[ShipMethod] AS [sm]
--		ON [soh].ShipMethodID = [sm].ShipMethodID

--WHERE 
--	(
--	[sm].ShipRate >= 1.49
--	AND [st].CountryRegionCode ='CA'
--	AND [soh].TotalDue BETWEEN 1000 AND 5000
--	AND [soh].OrderDate >= '2014-01-01'
--	)

--	OR
--	(
--		[st].CountryRegionCode ='us'
--		AND [soh].TerritoryID NOT IN(4,3)
--	)

--ORDER BY
--	[st].CountryRegionCode ASC

--SELECT 
--	  ProductNumber
--	, Name
--	,ListPrice
--	--, ListPrice * 1.010 AS 'New Price'
--	--, ListPrice AS 'Old prices'
--FROM 
--	[Production].[Product]
--WHERE 
--	ProductNumber LIKE 'BK-%'
--ORDER BY
--	ListPrice	DESC

--UPDATE [Production].[Product]
--SET ListPrice = ListPrice * 1.010
--WHERE 
--	ProductNumber LIKE 'BK-%'

--SELECT * FROM [dbo].[Courses]
----WHERE CourseName ='SQL SERVER'

--DELETE FROM [dbo].[Courses]
--WHERE CourseName ='SQL SERVER'