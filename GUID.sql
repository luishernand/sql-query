--GUID LLAVES PRIMARIAS QUE NO SEAN REPETIDAS

--SELECT NEWID() AS myguid
----E84BC960-574C-40C9-AF33-4403FB88AD39
----C2634755-0951-440D-89CB-1213D807E23B


--DECLARE @Identifier2 UNIQUEIDENTIFIER
--SET @Identifier2 = NEWID()

--SELECT @Identifier
--SELECT @Identifier2


--crear base de datos
--CREATE TABLE Courses
--(
--	CourseID UNIQUEIDENTIFIER PRIMARY KEY default NEWID()
--	,CourseName VARCHAR(50)
--)

--INSERT INTO Courses VALUES(default, 'SQL SERVER')
--INSERT INTO Courses VALUES(default, 'APP SHEET')
--INSERT INTO Courses ([CourseName])VALUES( 'Arduinio')

--SELECT * FROM Courses


--CREATE TABLE Courses2
--(
--	CourseID UNIQUEIDENTIFIER PRIMARY KEY default NEWSEQUENTIALID()
--	,CourseName VARCHAR(50)
--)

--INSERT INTO Courses2 VALUES(default, 'SQL SERVER')
----INSERT INTO Courses2 VALUES(default, 'APP SHEET')
--INSERT INTO Courses2([CourseName])VALUES( 'Arduinio')


--SELECT * FROM Courses
--SELECT * FROM Courses2

--SELECT * FROM [dbo].[Measures]

--INSERT INTO [dbo].[Measures] VALUES('T', 'Test2')
--SELECT SCOPE_IDENTITY()

