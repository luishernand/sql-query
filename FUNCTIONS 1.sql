-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
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
-- Author:		<LUIS HERNANDEZ>
-- Create date: <23/5/2022>
-- Description:	<DEVUELVE DATOS DE COMPRA POR PROVEEDOR >
-- =============================================
CREATE FUNCTION ufnGetPurchaseOrderTotalByVendor
(	
	-- Add the parameters for the function here
	@year		AS INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		[poh].VendorID
		, [v].Name
		, DATENAME(MONTH, [poh].OrderDate) as 'Mes'
		, poh.TotalDue
		, poh.Status
	FROM
		Purchasing.PurchaseOrderHeader AS [poh]
		INNER JOIN [Purchasing].[Vendor] AS [v]
			ON poh.VendorID = v.BusinessEntityID
	WHERE
		YEAR(poh.OrderDate) = @year
)
GO
