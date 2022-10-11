--VISTAS OR VIEWS
--CREATE VIEW view_name AS
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition; 


--SELECT 
--	poh.VendorID
--	, v.Name
--	, SUM(poh.TotalDue) AS Total
--FROM 
--	Purchasing.PurchaseOrderHeader AS [poh]
--	INNER JOIN Purchasing.Vendor  AS [v]
--		ON poh.VendorID = v.BusinessEntityID
--WHERE
--	YEAR(poh.OrderDate) = 2014
--GROUP BY 
--	poh.VendorID,
--	V.Name,
--	poh.OrderDate

--CREATE VIEW  PurchaseOrderTotalByVendor
--AS
--(
--		SELECT 
--			poh.VendorID
--			, v.Name
--			, DATENAME(MONTH, poh.OrderDate)  mes
--			, poh.TotalDue AS Total
--			, poh.Status AS estatus
			
--		FROM 
--				Purchasing.PurchaseOrderHeader AS [poh]
--				INNER JOIN Purchasing.Vendor  AS [v]
--					ON poh.VendorID = v.BusinessEntityID
--		WHERE
--				YEAR(poh.OrderDate) = 2014
			
--	);

--SELECT * FROM PurchaseOrderTotalByVendor
--WHERE VendorID =  1624  AND  Total < 50000


--DROP VIEW PurchaseOrderTotalByVendor