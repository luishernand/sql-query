--PIVOT AND UNPIVOT

--PIVOT--
--SELECT 
--	YEAR(Orderdate) as YearRef
--	, SUM(TotalDue) as Total
--FROM 
--	[Sales].[SalesOrderHeader]
--GROUP BY
--	OrderDate

--SELECT * FROM 
--(
--	SELECT 	
--			YEAR([OrderDate]) as YearRef
--			, TotalDue as Total
--	FROM 
--			[Sales].[SalesOrderHeader]
--	) AS Sales
--PIVOT 	
--	(
--		SUM(Total)
--		FOR  
--			YearRef IN([2011],[2012],[2013],[2014])
--	)AS pvt

--UNPIVOT
--SELECT YearRef, Total
--FROM
--	(
--		SELECT * FROM
--			(
--	SELECT 	
--			YEAR([OrderDate]) as YearRef
--			, TotalDue as Total
--	FROM 
--			[Sales].[SalesOrderHeader]
--	) AS Sales
--PIVOT 	
--	(
--		SUM(Total)
--		FOR  
--			YearRef IN([2011],[2012],[2013],[2014])
--	)AS pvt
--	) AS [t] UNPIVOT (Total FOR YearRef IN([2011],[2012],[2013],[2014])) AS upvt
