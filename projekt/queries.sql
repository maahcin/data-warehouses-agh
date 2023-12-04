-- running average (last 5 days)
with day_sum_amount as ( 
	SELECT
		SUM(fs.amount) as DayAmount,
		dd.Date
	FROM FactSales fs
	JOIN DIMDate dd 
		ON dd.DateKey = fs.DateKey
	GROUP BY dd.Date
)
SELECT 
	DayAmount,
	Date,
	AVG(DayAmount) OVER (ORDER BY Date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) as RollingAvg
FROM day_sum_amount


-- ranking klientów bior¹c pod uwagê wydatki na rok
with client_sum_per_year as (
	select
		dc.first_name,
		dc.last_name,
		sum(fs.amount) as amount_sum,
		dd.Year
	from FactSales fs
	join DIMDate dd on fs.DateKey = dd.DateKey
	join DimCustomers dc on dc.CustomerKey = fs.CustomerKey
	group by dc.first_name, dc.last_name, dd.Year
)
select 
	concat(first_name, ' ', last_name) as Client,
	amount_sum,
	Year,
	rank() over (order by amount_sum desc) as RankNo
from client_sum_per_year


-- procentowy udzia³ dostawcy w danym roku
with carrier_sum_by_year as (
	select 
		dc.carrier_name,
		dd.Year,
		sum(fs.amount) as year_sum
		--percent_rank() over (partition by dd.Year order by amount desc) as da
	from FactSales fs
	join DIMDate dd on fs.DateKey = dd.DateKey
	join DimCarrier dc on dc.CarrierKey = fs.CarrierKey
	group by dc.carrier_name, dd.Year
)
select
	carrier_name,
	Year,
	year_sum/sum(year_sum) over(partition by Year) as CarrierPercentagePerYear
from carrier_sum_by_year
