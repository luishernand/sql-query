----CASE ISNULL COALSCE

----SELECT 
---- [pod].ProductID,
---- [pod].UnitPrice,
---- CASE
----	WHEN [pod].UnitPrice <= 25 THEN
----	'LOWER' 
----	WHEN [pod].UnitPrice > 25 AND  [pod].UnitPrice <= 40 THEN 'MEDIUM'
----	WHEN [pod].UnitPrice > 40 AND  [pod].UnitPrice <= 60 THEN 'HIGH'
----	ELSE
----	'NO STATUS'
----	END AS 'STATUS'
----FROM	
----	[Purchasing].[PurchaseOrderDetail] AS [pod]


----SELECT 
---- [pod].ProductID,
---- [pod].UnitPrice,
---- CASE
----	WHEN [pod].UnitPrice <= 25 THEN
----	[pod].ReceivedQty 
----	WHEN [pod].UnitPrice > 25 AND  [pod].UnitPrice <= 40 THEN [pod].RejectedQty
----	WHEN [pod].UnitPrice > 40 AND  [pod].UnitPrice <= 60 THEN [pod].StockedQty
----	ELSE
----	0
----	END AS 'STATUS'
----	, [pod].ReceivedQty
----	,[pod].RejectedQty
----	,[pod].StockedQty
----FROM	
----	[Purchasing].[PurchaseOrderDetail] AS [pod]

----ISNULL
----SELECT	
----	[v].Name,
----	ISNULL([v].PurchasingWebServiceURL, 'www.luish.com') AS 'URL'
----FROM 
----	[Purchasing].[Vendor] AS [v]

----DECLARE @x AS VARCHAR(5)= NULL
----,	@y AS VARCHAR(10) = '123456789'
----SELECT COALESCE(@X, @Y) AS [COALESCE]
----, ISNULL(@X, @Y) AS [ISNULL]


 
	