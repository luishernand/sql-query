--PARTITION

--SELECT * FROM [Purchasing].[PurchaseOrderHeader]
--SELECT * FROM [Purchasing].Vendor


--SELECT 
--	v.Name
--	, po.ShipMethodID
--	, MIN(po.TotalDue) as MinTotal
--	, MAX(po.TotalDue) as MaxTotal
--	, AVG(po.TotalDue) as AvgTotal
--	, COUNT(po.TotalDue) as CountTotal
--FROM 
--	[Purchasing].[PurchaseOrderHeader] AS po
--	INNER JOIN [Purchasing].Vendor AS v
--		ON po.VendorID = v.BusinessEntityID

--GROUP BY 
--	v.Name
--	,po.ShipMethodID


--SELECT 
--	v.Name
--	, po.ShipMethodID
--	, MIN(po.TotalDue) OVER(PARTITION BY po.ShipMethodID) as MinTotal
--	, MAX(po.TotalDue) OVER(PARTITION BY po.ShipMethodID) as MaxTotal
--	, AVG(po.TotalDue) OVER(PARTITION BY po.ShipMethodID) as AvgTotal
--	, COUNT(po.TotalDue) OVER(PARTITION BY po.ShipMethodID) as CountTotal
--FROM 
--	[Purchasing].[PurchaseOrderHeader] AS po
--	INNER JOIN [Purchasing].Vendor AS v
--		ON po.VendorID = v.BusinessEntityID


SELECT 
	LocationID, 
	Bin, 
	SUM(Quantity) OVER(PARTITION BY LocationID) as particion
FROM 
	Production.ProductInventory
--GROUP BY
--	LocationID, 
--	Bin