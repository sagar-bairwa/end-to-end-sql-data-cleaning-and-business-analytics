------------------------------------------ 02_Customers_Insights ---------------------------------------------

use sql_project_ecommerce


select * from customers;
select * from orders;
select * from products;


---------------------------------------------------------------------------------------------------------------
--Top 10 customers By Revenue
select
	top 10 a.customer_name,
	FORMAT(sum(order_amount),'C0','en-IN') as Total_Sales
from customers as a
left join orders as b
on a.customer_id = b.customer_id
group by a.customer_name
order by sum(order_amount) desc


-------------------------------------------------------------------------------------------------------------
--Top 10 Customers By Orders
select
	top 10 a.customer_name,
	FORMAT(count(quantity),'N0','en-IN') as Total_Orders
from customers as a
left join orders as b
on a.customer_id = b.customer_id
group by a.customer_name
order by count(quantity) desc



--------------------------------------------------------------------------------------------------------------
--Average Spend per Customer
select
	format(
		(sum(b.order_amount)/count(distinct a.customer_id)),
		'C0','en-IN'
		) as Average_spend_per_customer
from customers as a
inner join orders as b
on a.customer_id = b.customer_id



--------------------------------------------------------------------------------------------------------------
--Customers having more than one order.
SELECT 
    a.customer_id,
    a.customer_name,
    COUNT(b.order_id) AS Total_Orders
FROM customers AS a
INNER JOIN orders AS b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.customer_name
HAVING COUNT(b.order_id) > 1
ORDER BY Total_Orders DESC;                            --- 1757 Repeated customers



--------------------------------------------------------------------------------------------------------------
--Age Group distribution
select max(age) from customers
select min(age) from customers

alter table customers
add age_group varchar(50)

update customers
set age_group =  ( case
				when age <20 then 'Teen'
				when age < 35 then 'Adult'
				when age <60 then 'Senior_Adult' 
				else 'Senior_Citizen'
			 end)



