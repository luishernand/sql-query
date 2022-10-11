--Derived table
--SELECT * FROM [Purchasing].[PurchaseOrderDetail]

--SELECT * FROM
--(
--	SELECT 
--		ROW_NUMBER() OVER(PARTITION BY [pod].PurchaseOrderID ORDER BY [pod].PurchaseOrderID) AS 'consecutive'
--	FROM 
--		[Purchasing].[PurchaseOrderDetail] AS [pod]
--) AS [result]

--WHERE 
--	[result].consecutive <= 3