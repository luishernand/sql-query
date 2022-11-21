/* ======================*/
/* 1. DISPLAY TOP 5 ROWS*/
/* ======================*/

SELECT TOP 5 * FROM [dbo].[Mall_Customers]

/* ======================*/
/* 2. DISPLAY LAST  5 ROWS*/
/* ======================*/
SELECT	TOP 5	* 
FROM	[dbo].[Mall_Customers] 
ORDER BY CustomerID DESC  


/* ===========================*/
/* 3. Select shape of dataset */
/* =========================== */

SELECT COUNT(*) filas 
FROM dbo.Mall_Customers 

SELECT COUNT(*) columnas
FROM information_schema.columns
WHERE table_name = 'Mall_Customers'

/* ====================================*/
/* 4. Informacion general de la tabla */
/* ==================================*/
SELECT *
--COUNT(*) columnas
FROM information_schema.columns
WHERE table_name = 'Mall_Customers'

/* ==========================================*/
/* 5. Check null values   contar datos nulos */
/* =========================================*/

SELECT COUNT (*) nulos
FROM dbo.Mall_customers
WHERE COALESCE
	(CustomerID, Genre, Age, Annual_Income_k, Spending_Score_1_100) IS NULL

/* ==========================================*/
/* 6. Get overal staticstics                 */
/* =========================================*/

SELECT 
		
		--MAX(Annual_Income_k) as [maximo_income],
		--MIN(Annual_Income_k) as [minimo_income],
		percentile_cont(0.25) within group(order by Annual_Income_k) over () as [25%income],
		percentile_cont(0.75) within group(order by Annual_Income_k) over () as [75%income],
		percentile_cont(0.95) within group(order by Annual_Income_k) over () as [95%income],
		--MAX(Spending_Score_1_100) as [maximo_spending],
		--MIN(Spending_Score_1_100) as  [minimo_spending],
		percentile_cont(0.25) within group(order by Spending_Score_1_100) over () as [25%spendind],
		percentile_cont(0.75) within group(order by Spending_Score_1_100) over () as [75%spending],
		percentile_cont(0.95) within group(order by Spending_Score_1_100) over () as [95%spending]
FROM dbo.Mall_customers


SELECT 
		
		MAX(Annual_Income_k) as [maximo_income],
		MIN(Annual_Income_k) as [minimo_income],
		
		MAX(Spending_Score_1_100) as [maximo_spending],
		MIN(Spending_Score_1_100) as  [minimo_spending]
		
FROM dbo.Mall_customers


/* ==========================================*/
/* 7. cantidad de personas por genre        */
/* =========================================*/
SELECT 
	genre,
	COUNT(genre) cantidad
from dbo.Mall_customers
group by genre

/* ==========================================*/
/* 7. cantidad de personas edad        */
/* =========================================*/
SELECT 
	Age,
	COUNT(genre) cantidad
from dbo.Mall_customers
group by Age
