--1.show all customers

--select * from customers

--2. show all numbers of customers
--select COUNT(customer_code) from customers

--3.Show transactions for Chennai market (market code for chennai is Mark001

--select * from transactions
--where market_code = 'Mark001'

--4. Show distrinct product codes that were sold in chennai
--select distinct product_code from transactions
--where market_code = 'Mark001'

-- 5. show transactions where currency is US dollars

--select * from transactions
--where currency = 'USD'

--6. Show total transaction in year 2020
--select * from transactions as t
--inner join date as d
--on
--d.date = t.order_date
--where d.year = '2020'
----select * from date

--7. Show total revenue in year 2020
--select SUM(t.sales_amount) from transactions as t
--inner join date as d
--on
--d.date = t.order_date
--where d.year = '2020'

--8. Show total revenue in year 2020, January Month
--select SUM(t.sales_amount) from transactions as t
--inner join date as d
--on
--d.date = t.order_date
--where d.month_name = 'January'

--9. Show total revenue in year 2020 in Chennai Markey MARK001
select SUM(t.sales_amount) from transactions as t
inner join date as d
on
d.date = t.order_date
where d.year = '2020' and t.market_code = 'Mark001'