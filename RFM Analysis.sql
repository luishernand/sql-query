--create database RFM
--use RFM
--go

select top 10  * from  sales

--checking the uniques values
select distinct status from sales
select distinct YEAR_ID from sales
select distinct ProductLine from sales
select distinct Country from sales
select distinct DEALSIZE from sales


--Analyse
-- group by sales by produline

select 
	PRODUCTLINE,
	sum(SALES) as Revenue
from sales
group by  PRODUCTLINE
order by 2 desc


--Sales By Year
select 
	YEAR_ID,
	sum(SALES) as Revenue
from sales
group by  YEAR_ID
order by 2 desc


--Sales by DEAL SIZE
select 
	DEALSIZE,
	sum(SALES) as Revenue
from sales
group by  DEALSIZE
order by 2 desc


----What was the best month for sales in a specific year? How much was earned that month? 

select 
	MONTH_ID,
	sum(SALES) as Revenue,
	count(ORDERLINENUMBER) as Frecuency
from sales
group by  MONTH_ID
order by 2 desc


select 
	MONTH_ID,
	sum(SALES) as Revenue,
	count(ORDERLINENUMBER) as Frecuency
from sales
where YEAR_ID ='2004' 
and MONTH_ID ='11'
group by  MONTH_ID
order by 2 desc


--What city has the highest number of sales in a specific country

select 
	CITY,
	sum(SALES) as Revenue,
	count(ORDERLINENUMBER) as Frecuency
from sales
where COUNTRY ='USA'
group by  CITY
order by 2 desc


---What is the best product in United States?
select 
	CITY,productline, country, YEAR_ID,
	sum(SALES) as Revenue,
	count(ORDERLINENUMBER) as Frecuency

from sales
where COUNTRY ='USA'
group by  CITY, productline, country, YEAR_ID
order by 6 desc

----Who is our best customer (this could be best answered with RFM)
--drop table if exists #rfm
select 
		CUSTOMERNAME, 
		sum(sales) MonetaryValue,
		avg(sales) AvgMonetaryValue,
		count(ORDERNUMBER) Frequency,
		max(ORDERDATE) last_order_date,
		(select max(ORDERDATE) from [dbo].sales) max_order_date,
		DATEDIFF(DD, max(ORDERDATE), (select max(ORDERDATE) from [dbo].sales)) Recency
	from sales
	group by CUSTOMERNAME
	

create or alter view vw_rfm as
select 
		x.*,
		case 
			when x.rfm_cell_string in(111, 112 , 121, 122, 123, 132, 211, 212, 114, 141) then'Lost Customer'
			when x.rfm_cell_string in(133, 134, 143, 244, 334, 343, 344, 144) then 'Slipping away'
			when x.rfm_cell_string in(311, 411, 331) then 'New customer'
			when x.rfm_cell_string in(222, 223, 233, 322, 232,234,221) then 'Potencial  churners'
			when x.rfm_cell_string in(323, 333,321, 422, 332, 432, 412, 423) then 'active'
			when x.rfm_cell_string in(433, 434, 443, 444) then 'loyal'
			end rfm_segnment

from
(
select 
	a.*,
		rfm_recency + rfm_frequency + rfm_monetary  as rfm_cell,
		cast(rfm_recency as varchar) + cast(rfm_frequency as varchar) + cast(rfm_monetary as varchar) as rfm_cell_string
		

from

(
select r.* ,
	NTILE(4) over (order by r.MonetaryValue)  as rfm_monetary
	, NTILE(4) over (order by r.Frequency)  as rfm_frequency
	, NTILE(4) over (order by r.Recency)  as rfm_recency

from
(select 
		CUSTOMERNAME, 
		sum(sales) MonetaryValue,
		avg(sales) AvgMonetaryValue,
		count(ORDERNUMBER) Frequency,
		max(ORDERDATE) last_order_date,
		(select max(ORDERDATE) from [dbo].sales) max_order_date,
		DATEDIFF(DD, max(ORDERDATE), (select max(ORDERDATE) from [dbo].sales)) Recency
	from sales
	group by CUSTOMERNAME)r
	)a 
	)x

select * from vw_rfm
where rfm_cell >=10
