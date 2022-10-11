
--SELECT 
--	* 
--FROM 
--	[Production].[Product] as [p]
--WHERE
--	[p].Name LIKE'%chaghghhggh%'

----SELECT @@ROWCOUNT

--IF @@ROWCOUNT>=1
--BEGIN 
--	SELECT 
--		* 
--	FROM 
--		[Production].[Product] as [p]
--	WHERE
--	[p].Name LIKE'%cha%' AND [p].Color = 'Silver'

--	SELECT @@ROWCOUNT
--END
--ELSE
--BEGIN
--	SELECT 'NO DATA'
--END


--SELECT * FROM [Production].[Location]

--UPDATE [Production].[Location]
--SET 
--	Availability = 10
--WHERE
--	LocationID IN(1,2,3)
--SELECT @@ROWCOUNT

--2. COMPRES FUNTIONS
--SELECT COMPRESS('SQL SERVER') AS compressed_value
--SELECT DECOMPRESS(0x1F8B08000000000004000B0EF45108760D0A730D0200E55D587E0A000000) AS Decompressed_value
--SELECT CAST(DECOMPRESS(0x1F8B08000000000004000B0EF45108760D0A730D0200E55D587E0A000000) AS VARCHAR(MAX)) AS numero_value

--3. session context
--EXEC sp_set_session_contex 'BusinessEntityID', 10
--SELECT SESSION_CONTEXT(N'BusinessEntityID') AS BusinessEntityID
