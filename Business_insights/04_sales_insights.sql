------------------------------------------ 04_Sales_Insights ---------------------------------------------

use sql_project_ecommerce


select * from customers;
select * from orders;
select * from products;


----------------------------------------------------------------------------------------------------------------- 
--Montly Revenue Trend
select
    year(order_date) as sales_year,
    month(order_date) as sales_month,
    FORMAT(sum(order_amount),'C0','en-IN') as total_revenue
from orders
group by
    year(order_date),
    month(order_date)
order by
    sales_year,
    sales_month;



-----------------------------------------------------------------------------------------------------------------
--Monthly Order Trend
select
    year(order_date) as sales_year,
    month(order_date) as sales_month,
    count(order_id) as total_orders
from orders
group by
    year(order_date),
    month(order_date)
order by
    sales_year,
    sales_month;



--------------------------------------------------------------------------------------------------------------------
--Daily Average Revenue
select
    order_date,
    format(avg(order_amount),'C0','en-IN') as average_daily_order_value
from orders
group by order_date
order by order_date;



--------------------------------------------------------------------------------------------------------------------
--Revenue by Weekday
select
    datename(weekday, order_date) as weekday_name,
    format(sum(order_amount),'C0','en-IN') as total_revenue
from orders
group by datename(weekday, order_date)
order by total_revenue desc;



--------------------------------------------------------------------------------------------------------------------
--------------------------------------------- Geographic Insights --------------------------------------------------

--Revenue by State
select
    c.state,
    FORMAT(sum(order_amount),'C0','en-IN') as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.state
order by total_revenue desc;



--------------------------------------------------------------------------------------------------------------------
--Top 10 Cities by Revenue
select top 10
    c.city,
    FORMAT(sum(order_amount),'C0','en-IN') as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
where city is not null
group by c.city
order by total_revenue desc;



--------------------------------------------------------------------------------------------------------------------
--Orders by State
select
    c.state,
    count(o.order_id) as total_orders
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.state
order by total_orders desc;