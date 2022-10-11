-- CROSS APPLY
--inner
--SELECT 
--	count(*)
--FROM 
--	[Sales].[SalesOrderHeader] as [soh]
--	INNER JOIN [Sales].[CurrencyRate] as [cr]
--		ON soh.CurrencyRateID = cr.CurrencyRateID
--	INNER JOIN [Sales].[Currency] AS [c]
--		ON cr.FromCurrencyCode =  c.CurrencyCode
--WHERE
--	cr.ToCurrencyCode = 'eur'


--cross apply


--SELECT 
--	* 
--FROM 
--	[Sales].[SalesOrderHeader] AS [soh]
--	CROSS APPLY
--		(
--			SELECT 
--				cr.*
--			FROM 
--				 [Sales].[CurrencyRate] as [cr]
--				 INNER JOIN [Sales].[Currency] AS [c]
--					ON cr.FromCurrencyCode =  c.CurrencyCode
--			WHERE
--				[soh].CurrencyRateID = cr.CurrencyRateID
--		) AS c1
--WHERE 
--	c1.ToCurrencyCode = 'EUR';

	
