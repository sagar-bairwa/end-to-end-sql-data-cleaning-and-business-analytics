--------------------------------------- 01_Dashboard_KPIs ----------------------------------------

use sql_project_ecommerce

select * from customers;
select * from orders;
select * from products;


--------------------------------------------------------------------------------------------------
--Total Revenue
SELECT 
	'Total_Revenue' as KPI,
	format(SUM(order_amount),'C0','en-IN') as Total
FROM orders

Union all

--Average Ordered amount
select 
	'Average_order_amount' as KPI,
	format(avg(order_amount),'C0','en-IN') as Total
from orders

Union all

--Total Orders
select 
	'Total_orders' as KPI,
	format(count(distinct order_id),'N0','en-IN') as Total
from orders

union all

--Total Customers
select 
	'Total_Customers' as KPI,
	format(count(distinct customer_id),'N0','en-IN') as Total
from customers

Union all

--Total Units Sold
select
	'Total_Sold_Units' as KPI,
	format(sum(quantity),'N0','en-IN') as Total
from orders