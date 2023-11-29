create view SalesCustomer
with schemabinding
as
select 
	fs.OrderKey,
	fs.order_id,
	fs.DateKey,
	dc.CustomerKey
from dbo.FactSales fs
join dbo.DimCustomers dc
	on fs.CustomerKey = dc.CustomerKey
GO

select * from SalesCustomer

create unique clustered index IX_SalesCustomer 
on dbo.SalesCustomer (OrderKey, order_id, DateKey, CustomerKey)