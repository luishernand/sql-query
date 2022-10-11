--IIF
--SELECT IIF(1=1, 'VERDADERO','FALSO') AS [IFF]

--SELECT IIF(LEN('SQL SERVER DESDE CERO')=10,'OK', 'NOT OK') AS 'COURSE'

--SELECT 
--	[e].LoginID
--	,[e].JobTitle
--	,IIF([e].Gender = 'M', 'Male', 'Famale') AS [Gender]
--FROM 
--	[HumanResources].[Employee] AS [e]

--SELECT 
--	[pod].ProductID
--	,[pod].UnitPrice
--	,[pod].StockedQty
--	,IIF([pod].UnitPrice<25 AND [pod].StockedQty <5, 'Yes', 'No') as [request]
--FROM 
--	[Purchasing].[PurchaseOrderDetail] AS [pod]

--SELECT CHOOSE(3, 'sql server', 'oracle', 'mariadb') as 'DB'


