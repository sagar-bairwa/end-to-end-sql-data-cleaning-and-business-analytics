---------------------------------- 05_Orders_Table_Cleaning ---------------------------------------

use sql_project_ecommerce

--Creating a bakcup table
select * into orders
from project2_orders --Drop table orders

---------------------------------------- Cleaning -------------------------------------------------
---------------------------------------------------------------------------------------------------

--Duplicate order id
with duplicate as (
	select 
		order_id,
		ROW_NUMBER() over (
			partition by order_id order by (select null)
		) as rn
	from orders
)
Delete from duplicate
where rn > 1


--customer id must exist in customer table
delete from orders
where customer_id not in (
	select customer_id
	from customers
	where customer_id is not null
)


--ordered date must be valid
delete from orders
where TRY_CONVERT(date, order_date) is null 


--order amount must be greater than 0
delete from orders
where order_amount < 0 


--Order Status must be Completed only
Delete from orders
where not (order_status = 'completed')


select * from orders

--change dataype of product id into varchar
alter table orders
alter column product_id int

alter table orders
alter column product_id varchar(50)


select * from orders