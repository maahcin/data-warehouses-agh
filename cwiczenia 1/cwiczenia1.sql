-- zadanie 1
with sales_18th_feb as (
	select 
		order_id,
		sum(total_price) as order_sum
	from pizza_sales
	where order_date = '2015-02-18'
	group by order_id
) 
select 
	avg(s.order_sum) as average_order_price
from sales_18th_feb s;


-- zadanie 2
with sales_march as (
	select 
		* 
	from pizza_sales 
	where order_date like '2015-03%'
)
select 
	distinct(s.order_id)
from sales_march s
where s.order_id not in (select order_id from sales_march s where pizza_ingredients like '%pineapple%')

-- zadanie 3
select top(10)
	s.order_id,
	s.order_price,
	rank() over(order by s.order_price desc) rank
from (
	select	
		order_id,
		sum(total_price) as order_price
	from pizza_sales
	where order_date like '2015-02%'
	group by order_id
) s

-- zadanie 4
with total_order_amounts as (
	select 
		order_id,
		order_date,
		left(order_date, 7) as year_month,
		sum(total_price) as order_amount
	from pizza_sales
	group by order_id, order_date, left(order_date, 7)
),
average_month_amount as (
	select 
		left(order_date, 7) as year_month,
		avg(order_amount) as average_month_amount
	from total_order_amounts
	group by left(order_date, 7)
)
--select * from average_month_amount
select 
	toa.order_id,
	toa.order_amount,
	ama.average_month_amount,
	toa.order_date as date
from total_order_amounts toa
join average_month_amount ama
	on toa.year_month = ama.year_month

--zadanie 5
with january_1st_sales as (
	select
		*
	from pizza_sales
	where order_date='2015-01-01'
)
select 
	count(*) as order_count,
	order_date as date,
	DATEPART(hour, order_time) as hour
from january_1st_sales
group by order_date, datepart(hour, order_time);

--zadanie 6
with january_sales as (
	select
		*
	from pizza_sales
	where order_date like '2015-01%'
)
select 
	pizza_name,
	pizza_category,
	sum(quantity) as pizza_count
from january_sales
group by pizza_name, pizza_category
order by pizza_count desc

--zadanie 7
with feb_and_march_sales as (
	select
		*
	from pizza_sales
	where order_date >= '2015-02-01' 
	and order_date <= '2015-03-31'
)
select 
	pizza_size,
	sum(quantity) as count
from feb_and_march_sales
group by pizza_size