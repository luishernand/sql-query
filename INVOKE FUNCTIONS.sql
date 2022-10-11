--TABLES VALUES FUNCTIONS
SELECT  
	[fun].VendorID
	, fun.Name
	, fun.Mes
	, fun.TotalDue
	, fun.Status
	, v.ActiveFlag
FROM 
	[dbo].[ufnGetPurchaseOrderTotalByVendor](2014) AS [fun]
	INNER JOIN Purchasing.Vendor AS [v]
		ON [v].BusinessEntityID = [fun].VendorID
WHERE 
	V.ActiveFlag =1