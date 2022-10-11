--LAG () , LEAD FISRT VALUE

SELECT 
	LocationID,
	Shelf,
	Bin,
	Quantity,
	LAG(Quantity) OVER(PARTITION BY [ProductID] ORDER BY [ProductID]) AS [Bef]
	, LEAD(Quantity) OVER(PARTITION BY [ProductID] ORDER BY [ProductID]) AS [aft]
	, FIRST_VALUE(Quantity) OVER(PARTITION BY [ProductID] ORDER BY [ProductID]) AS [fir]
	, LAST_VALUE(Quantity) OVER(PARTITION BY [ProductID] ORDER BY [ProductID]) AS [last]
FROM 
	Production.ProductInventory