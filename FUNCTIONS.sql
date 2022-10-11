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
-- Author:		LUIS HERNANDEZ
-- Create date: 23/5/2022
-- Description:	Retorna 
-- =============================================
CREATE FUNCTION ufnGetInventory
(	
	-- Add the parameters for the function here
	@productID as INT = 0
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		1000		AS  [LocationID]
		,[ProductID]
      ,SUM([Quantity]) AS TotalStockQuantity
  FROM [AdventureWorks2019].[Production].[ProductInventory]
WHERE 
ProductID=@productID
GROUP BY 
	[ProductID]
UNION ALL
SELECT 
		[LocationID]		AS  [LocationID]
		,[ProductID]
      ,SUM([Quantity]) AS TotalStockQuantity
  FROM [AdventureWorks2019].[Production].[ProductInventory]
  WHERE 
ProductID=@productID
GROUP BY 
	[ProductID]
	,LocationID

)
GO
