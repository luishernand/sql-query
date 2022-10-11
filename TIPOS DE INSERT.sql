----INSERT INTO

--CREATE TABLE [Sales].[SalesOrderHeaderBackup]
--	(
--	SalesOrderID	INT	NOT NULL	PRIMARY KEY
--	, OrderDate		DATETIME	NOT NULL
--	, ShipDate		DATETIME	 NULL
--	, CustomerID INT	NOT NULL
--	, Status TINYINT		NOT NULL
--	, TotalDue	MONEY NOT NULL
--	, TaxAmt	MONEY NOT NULL
--	);


--INSERT INTO [Sales].[SalesOrderHeaderBackup]
--	(
--		[SalesOrderID],
--		OrderDate, 
--		ShipDate, 
--		CustomerID,
--		[Status], 
--		TotalDue, 
--		TaxAmt
--	)
--SELECT
--		[SalesOrderID],
--		OrderDate, 
--		ShipDate, 
--		CustomerID,[Status], 
--		TotalDue, TaxAmt
--FROM 
--	[Sales].[SalesOrderHeader]
--WHERE
--	TotalDue > = 500;

--SELECT * FROM [Sales].[SalesOrderHeaderBackup]

----DELETE FROM [Sales].[SalesOrderHeaderBackup]

----SELECT INTO
--DROP TABLE IF EXISTS [Sales].[SalesOrderHeaderBackup]
--SELECT 
--	[SalesOrderID],
--		OrderDate, 
--		ShipDate, 
--		CustomerID,
--		[Status], 
--		TotalDue, 
--		TaxAmt
--INTO 
--	[Sales].[SalesOrderHeaderBackup]
--FROM 
--	[Sales].[SalesOrderHeader]
--WHERE 
--	TotalDue > = 500;