------------------------------------------ 03_Products_Insights ---------------------------------------------

use sql_project_ecommerce


select * from customers;
select * from orders;
select * from products;


----------------------------------------------------------------------------------------------------------------- 
--Top 10 Products by Revenue
select 
	top 10 product_name,
	category,
	FORMAT(sum(order_amount),'C0','en-IN') as Total_Revenue
from orders as a
	left join products as b
	on a.product_id = b.product_id
where product_name is not null
group by product_name, category
order by sum(order_amount) desc;



-------------------------------------------------------------------------------------------------------------
--Top 10 Products By Quantity
select 
	top 10 product_name,
	category,
	FORMAT(count(quantity),'N0','en-IN') as Total_Quantity
from orders as a
	left join products as b
	on a.product_id = b.product_id
where product_name is not null
group by product_name, category
order by count(quantity) desc;



--------------------------------------------------------------------------------------------------------------
--Revenue by Category ( Electronics, Fashion, Home, Sports, Beauty )
select 
	b.category,
	format(sum(order_amount),'C0','en-IN')  as Total_Revenue
from orders as a 
left join products as b
on a.product_id = b.product_id
where b.category is not null
group by b.category
order by sum(order_amount) desc



--------------------------------------------------------------------------------------------------------------
--Units Sold by Category ( Electronics, Fashion, Home, Sports, Beauty )
select 
	b.category,
	format(count(quantity),'N0','en-IN')  as Total_Units_Sold
from orders as a 
left join products as b
on a.product_id = b.product_id
where b.category is not null
group by b.category
order by count(quantity) desc



--------------------------------------------------------------------------------------------------------------
--Average Selling Price per Unit
select
	format(
		(sum(order_amount)/sum(quantity)),
		'C0','en-IN'
		) as Average_Selling_Price_per_Unit
from orders;







