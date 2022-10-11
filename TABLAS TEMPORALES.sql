--Tablas temporales leccion 36 LOCALES Y GLOBALES
--LOCAL

--SELECT 
--	* 
--FROM	
--	[Production].Location


CREATE TABLE #location_temp
(
	[LocationID]			SMALLINT		NOT NULL
			,[Name]					NVARCHAR(50)	NOT NULL
			,[CostRate]				SMALLMONEY		NOT NULL
			,[Availability]			DECIMAL(8,2)	NOT NULL
			,[ModifiedDate]			DATETIME		NOT NULL
);


SELECT 
	* 
FROM	
	[Production].Location
WHERE
	CostRate = 0


INSERT INTO #location_temp
SELECT 
	LocationID, Name, CostRate, Availability, ModifiedDate
FROM	
	[Production].Location
WHERE
	CostRate = 0

SELECT * FROM #location_temp