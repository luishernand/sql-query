--use RFM

---select top 100* from [dbo].[sales_data]



CREATE VIEW  VW_RFM_Sales AS
/**0. For make a RFM you can continue step by numbers **/	
/**5. Segment or labeling by RFM score **/
SELECT 
		x.*,
		CASE
			WHEN x.RFMScores <=3 THEN 'BRONZE'
			WHEN x.RFMScores <=6 THEN 'SILVER'
			ELSE 'GOLD' end as SEGMENT
FROM 

/**4. Add Columns RFM scores and grouping **/
		(SELECT 
				c.*,
				RFMScores = c.R + c.F + c.M
				, RFMGroup = cast(c.R as varchar) + cast(c.F as varchar) + cast(c.M as varchar)
		FROM 


		/**3. Rating with NTILE**/
			(select 
					b.CustomerID, b.Recency, b.Frequency,b.Monetary,
					NTILE(3) OVER (ORDER BY b.Recency DESC)AS R,
					NTILE(3) OVER (ORDER BY b.Frequency ASC)AS F,
					NTILE(3) OVER (ORDER BY b.Monetary ASC)AS M


			FROM 

			/**2. Calculate RFM columns**/
					(SELECT 
		
							a.CustomerID,
			 
						-- (select max(OrderDate) from [dbo].[sales_data]) as max_order_date
						--,(select max(OrderDate) from [dbo].[sales_data] where CustomerID = a.CustomerID) as max_customer_order_date
						datediff(day, (select max(OrderDate) from [dbo].[sales_data] where CustomerID = a.CustomerID), (select max(OrderDate) from [dbo].[sales_data])) as Recency
						, count(a.CustomerID) as Frequency
						, sum(a.sales) as Monetary
		
					from 


			/**1. create sale column and only select the specific columns**/

					(select 
		
							CustomerID,
							OrderNumber,
							OrderDate,
							sales = sum(round((Unit_Price - Unit_Cost - Discount_Applied) * Order_Quantity ,2))
		
					from [dbo].[sales_data]
					group by CustomerID,OrderNumber, OrderDate
					)a
					group by a.CustomerID
					)b
					)c
					)x


SELECT 
	* 
FROM 
	VW_RFM_SALES
WHERE 
	SEGMENT ='GOLD'

SELECT 
	SEGMENT,
	count(SEGMENT) as Cat 
FROM VW_RFM_SALES
GROUP BY SEGMENT
ORDER BY 2 DESC


