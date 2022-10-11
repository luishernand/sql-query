--GROUP BY OR HAVING


--SELECT 
--	[sod].ProductID
--	, p.Name
--	, COUNT([sod].[ProductID]) AS ProdCount
--	, SUM([sod].[UnitPrice]) AS Total
--	, p.Class
--FROM 
--	Sales.SalesOrderDetail AS [sod]
--	INNER JOIN Production.Product  AS [p]
--		ON [p].[ProductID] = sod.ProductID
--WHERE
--	p.Class IS	NOT NULL
--GROUP BY
--	sod.ProductID
--	, p.Name
--	, p.Class
--HAVING 
--	COUNT(sod.ProductID) >=200




