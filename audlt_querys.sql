-- 1. Select the first 10 rows

select top(10) * from [dbo].[adult];


--2.  Select the last 10 rows

--3. Find Shape of Our Dataset
select COUNT(*) as [filas] 
from [dbo].[adult];

select  count(*) as [columnas]
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'adult';

--4 . view general info
--5. Check Null Values In The Dataset
select count(*) as[null_vals]from adult
where workclass is null;

--6.Perform Data Cleaning [ Replace '?' with NaN ]
select * from adult
where [native-country] ='?' 
or  occupation = '?'
select DISTINCT(workclass) from adult;
select DISTINCT(occupation) from adult;

update adult
set workclass =NULL
where workclass ='?'

update adult
set occupation =NULL
where occupation ='?'
update adult
set [native-country] =NULL
where [native-country] ='?'

--Now we gonna see null vaues
select count(*) as[native_nulls]
		from adult
where [native-country] is null

select count(*) as[occupa_nulls]
		from adult
where [occupation] is null
select count(*) as[work_null]
		from adult
where [workclass] is null

--7. select not nul values
--create a view to filter null values
select * from adult
where occupation is not null
and workclass is not null
and [native-country] is not null

create view adult_not_null
as (
	select * from adult
	where occupation is not null
	and workclass is not null
	and [native-country] is not null
);

select * from [dbo].[adult_not_null]

--verify is the view have any nulls value
select count(*) as[occupa_nulls]
		from [dbo].[adult_not_null]
		where [occupation] is null

--8. EDA Find Total Number of Persons Having Age Between 17 To 48 (Inclusive) Using Between Method
select count(*) as [person_betwenn]
from [dbo].[adult_not_null]
where age between 17 and 48;

select count(workclass)
from [dbo].[adult_not_null]

