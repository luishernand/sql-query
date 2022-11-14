--use PortafolioProject
--see dataset
--select * from [dbo].[Mushroom]


--check top 5
--select top 5 * from dbo.[Mushroom]

-- select the las 5  rows
--select top 5 * from dbo.[Mushroom]
--order by class


--total of rows
--select count(*) from dbo.Mushroom

/*Muestra todas las tablas de la db*/
SELECT table_name AS nombre
FROM information_schema.tables --WHERE table_schema = 'PortafolioProject';

/*Muestra cantidad de columna de una tabla*/

SELECT count(*)
FROM information_schema.columns
WHERE table_name = 'Mushroom'

SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COUNT(COLUMN_NAME ) ColCount
FROM INFORMATION_SCHEMA.COLUMNS
GROUP BY TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME
ORDER BY TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME;

SELECT 
	 column_name,
	 ORDINAL_POSITION, 
	 IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME like'%Mush%'
