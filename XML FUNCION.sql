-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Luis Hernandez
-- Create date: 25/5/2022
-- Description:	Crea un XML
-- =============================================
CREATE FUNCTION UDF_CreatePO
(
	
	@PONumber AS INT
)
RETURNS XML
AS
BEGIN
	
	DECLARE @XMLResult XML
	
	SET @XMLResult = 

	
	(
		SELECT
			poh.VendorID,
			v.Name  AS Vendedor
			, FORMAT(poh.[PurchaseOrderID], '000000') AS PONumber
			, sm.Name AS [shipmethod]
			, poh.TotalDue AS [Total]
			,
			(
				SELECT 
					ROW_NUMBER() OVER(PARTITION BY poh.[PurchaseOrderID] ORDER BY poh.[PurchaseOrderID]) AS [Items]
					, p.Name AS 'Product'
					, pod.OrderQty
					, pod.UnitPrice
					, pod.LineTotal
				FROM 
					Purchasing.PurchaseOrderDetail AS [pod]
					INNER JOIN	Production.Product AS [p]
						ON pod.ProductID = p.ProductID
				WHERE
					pod.PurchaseOrderID = poh.PurchaseOrderID
				FOR XML PATH('LineItmes'), TYPE
			)
	FROM
			[Purchasing].[PurchaseOrderHeader] AS [poh]
			INNER JOIN	Purchasing.Vendor AS [v]
				ON poh.VendorID = v.BusinessEntityID
			INNER JOIN Purchasing.ShipMethod AS [sm]
				ON poh.ShipMethodID = sm.ShipMethodID
	WHERE
		poh.PurchaseOrderID = @PONumber
		FOR XML PATH('PurchaseOrder'), TYPE
	)
	
	RETURN @XMLResult

END
GO

