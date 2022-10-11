--XLM

--SELECT 
--	poh.VendorID
--	, v.Name AS VendorName
--	, FORMAT(poh.PurchaseOrderID, '000000') AS [PONumber]
--	, sm.Name AS ShipName
--	, poh.TotalDue
--	, ROW_NUMBER() OVER(PARTITION BY poh.PurchaseOrderID ORDER BY poh.PurchaseOrderID) AS Items
--	, p.Name  AS Products
--	, pod.OrderQty
--	, pod.UnitPrice
--	, pod.LineTotal
--FROM	
--	[Purchasing].[PurchaseOrderHeader] AS poh
--	INNER JOIN [Purchasing].[Vendor] AS v
--		ON poh.VendorID = v.BusinessEntityID
--	INNER JOIN [Purchasing].[ShipMethod] AS sm
--		ON poh.ShipMethodID = sm.ShipMethodID
--	INNER JOIN	[Purchasing].[PurchaseOrderDetail] AS pod
--		ON poh.PurchaseOrderID = pod.PurchaseOrderID
--	INNER JOIN	[Production].[Product] AS p
--		ON	pod.ProductID = p.ProductID
--WHERE
--	poh.PurchaseOrderID = 165
--FOR XML PATH('Purchaseorder')
--FOR XML RAW
--FOR XML AUTO, ELEMENTS, ROOT('PurchseOrder')


SELECT 
	poh.VendorID
	, v.Name AS VendorName
	, FORMAT(poh.PurchaseOrderID, '000000') AS [PONumber]
	, sm.Name AS ShipName
	, poh.TotalDue
	,(
		SELECT 
			ROW_NUMBER() OVER(PARTITION BY poh.PurchaseOrderID ORDER BY poh.PurchaseOrderID) AS [@Items]
		, p.Name  AS [@Products]
		, pod.OrderQty 
		, pod.UnitPrice
		, pod.LineTotal
		FROM 
			[Purchasing].[PurchaseOrderDetail] AS pod
				--ON poh.PurchaseOrderID = pod.PurchaseOrderID
			INNER JOIN	[Production].[Product] AS p
				ON	pod.ProductID = p.ProductID
		WHERE
			poh.PurchaseOrderID = pod.PurchaseOrderID
		FOR XML PATH('LineItmes'), TYPE
		)
	
FROM	
	[Purchasing].[PurchaseOrderHeader] AS poh
	INNER JOIN [Purchasing].[Vendor] AS v
		ON poh.VendorID = v.BusinessEntityID
	INNER JOIN [Purchasing].[ShipMethod] AS sm
		ON poh.ShipMethodID = sm.ShipMethodID
	
WHERE
	poh.PurchaseOrderID = 165
FOR XML PATH('Purchaseorder'), ROOT('DATA')