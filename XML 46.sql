--OPEN XML

SELECT
	poh.VendorID
	, v.Name  AS 'Vendor'
	, FORMAT(poh.PurchaseOrderID, '000000') AS 'PONumber'
	, poh.TotalDue
	,ROW_NUMBER() OVER(PARTITION BY poh.PurchaseOrderID ORDER BY poh.PurchaseOrderID) AS 'Itmes'
	, pod.OrderQty
	, pod.UnitPrice
	, pod.LineTotal
FROM
	Purchasing.PurchaseOrderHeader		AS [poh]
	INNER JOIN Purchasing.Vendor		AS [v]
		ON poh.VendorID = v.BusinessEntityID
	INNER JOIN Purchasing.ShipMethod		AS [sm]
		ON poh.ShipMethodID = sm.ShipMethodID
	INNER JOIN Purchasing.PurchaseOrderDetail		AS [pod]
		ON poh.PurchaseOrderID = pod.PurchaseOrderDetailID
	INNER JOIN Production.Product		AS [p]
		ON pod.ProductID = p.ProductID

WHERE	
	sm.ShipMethodID = 3

FOR XML PATH ('PurchaseOrder'), TYPE	