--use cohort


--total records 541909
select top 10 * from online_retail


--total records  406829
--ttal records cleaning 397924

--check duplicates
CREATE VIEW vw_retail AS
SELECT 
	x.*
FROM 
(
	SELECT 
		a.*
		,ROW_NUMBER() over(partition by a.InvoiceNo, a.Stockcode, a.quantity order by InvoiceDate) duplicates

	FROM 
(	
	SELECT 
		*
	FROM online_retail
	WHERE 1=1
		AND CustomerID !=0
		AND InvoiceNo !=0
		and UnitPrice>0
		and Quantity >0
	)a

)x
where 1 = 1
and x.duplicates = 1

---Begin cohort analysis #create temp table
select 
	CustomerID
	, MIN(InvoiceDate) firts_purchase
	, DATEFROMPARTS(year(MIN(InvoiceDate)), month(min(InvoiceDate)),1) cohort_date
into #cohort
from vw_retail
group  by CustomerID



--view temp table
select * from #cohort

-- create cohort index
select 
	mmm.*,
	cohort_index = year_diff * 12 + month_diff +1
	into #cohort_retention
from
(
SELECT 
	mm.*
	, year_diff = invoice_year - cohort_year
	, month_diff = invoice_month - cohort_month
--into drop table #cohort_retention
FROM 
(
	SELECT 
		m.*,
		c.cohort_date
		 ,YEAR(m.InvoiceDate) invoice_year
		, MONTH(m.InvoiceDate) invoice_month
		,YEAR(c.cohort_date) cohort_year
		, MONTH(c.cohort_date) cohort_month
	FROM vw_retail m
		LEFT JOIN #cohort c
			ON m.CustomerID = c.CustomerID
)mm
)mmm


---pivot table

select 
 	*
into  #cohort_pivot
from
	(	
	select distinct 
		CustomerID
		, cohort_date
		, cohort_index
	
	from #cohort_retention
	)tbl
	pivot(
	
		count(CustomerID)
		for cohort_index in 
		(
		[1],[2],[3],[4],[5],[6],[7],[8],
		[9],[10],[11],[12],[13]
	)
	)as pivot_table



select * from #cohort_pivot
order by cohort_date


select 
	cohort_date 
	, (1.0 * [1]/[1] * 100)as [1]
	, (1.0 * [2]/[1] * 100) as [2]
	, (1.0 * [3]/[1] * 100) as [3]
	, (1.0 * [4]/[1] * 100) as [4]
	, (1.0 * [5]/[1] * 100) as [5]
	, (1.0 * [6]/[1] * 100) as [6]
	, (1.0 * [7]/[1] * 100) as [7]
	, (1.0 * [8]/[1] * 100) as [8]
	, (1.0 * [9]/[1] * 100) as [9]
	, (1.0 * [10]/[1] * 100) as [10]
	, (1.0 * [11]/[1] * 100) as [11]
	, (1.0 * [12]/[1] * 100) as [12]
	, (1.0 * [13]/[1] * 100) as [13]

from #cohort_pivot
order by cohort_date






