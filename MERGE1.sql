---MERGE: SIRVE PARA HACER INSERT UPDATE O DELETE EN UN SOLO COMANDO


--CREATE TABLE StudentC1
--	(
--		StudentID INT
--		, StudentName	VARCHAR(50)
--		, StudentSatatus BIT

--	)



----INSERT INTO [dbo].[StudentC1]([StudentID],[StudentName],[StudentSatatus]) VALUES(1,'Axel Romero',1)
--INSERT INTO [dbo].[StudentC1]([StudentID],[StudentName],[StudentSatatus]) VALUES(2,'Sofía Mora',1)
--INSERT INTO [dbo].[StudentC1]([StudentID],[StudentName],[StudentSatatus]) VALUES(3,'Rogelio Rojas',0)
--INSERT INTO [dbo].[StudentC1]([StudentID],[StudentName],[StudentSatatus]) VALUES(4,'Mariana Rosas',1)
--INSERT INTO [dbo].[StudentC1]([StudentID],[StudentName],[StudentSatatus]) VALUES(5,'Roman Zavaleta',1)


--CREATE TABLE StudentC2
--	(
--		StudentID INT
--		, StudentName	VARCHAR(50)
--		, StudentSatatus BIT

--	)


--INSERT INTO [dbo].[StudentC2]([StudentID],[StudentName],[StudentSatatus]) VALUES(1,'Axel Romero Rendón',1)
--INSERT INTO [dbo].[StudentC2]([StudentID],[StudentName],[StudentSatatus]) VALUES(2,'Sofía Mora Ríos',0)
--INSERT INTO [dbo].[StudentC2]([StudentID],[StudentName],[StudentSatatus]) VALUES(6,'Mario Gonzalez Pae',1)
--INSERT INTO [dbo].[StudentC2]([StudentID],[StudentName],[StudentSatatus]) VALUES(7,'Alberto García Morales',1)

--SELECT * FROM [dbo].[StudentC1]
--SELECT * FROM [dbo].[StudentC2]

--MERGE [dbo].[StudentC1] AS [tgt]
--USING
--(
--	SELECT
--		[s].[StudentID]
--		,[s].[StudentName]
--		,[s].[StudentSatatus]
--	FROM 
--		[dbo].[StudentC2] AS [s]
--) AS [src]
--ON
--	(
--		[src].[StudentID] = [tgt].[StudentID]
--	)
----for updates
--	WHEN MATCHED THEN
--		UPDATE
--			SET
--				[tgt].[StudentName] = [src].[StudentName]
--				, [tgt].[StudentSatatus] = [src].[StudentSatatus]
----for insert
--	WHEN NOT MATCHED THEN
--		INSERT 
--		(
--			[StudentID],[StudentName],[StudentSatatus]
--		)
--		VALUES
--		(
--			[src].[StudentID],[src].[StudentName],[src].[StudentSatatus]
--		);