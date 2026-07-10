---------------------------------- 01_data_profiling ------------------------------------

use sql_project_ecommerce

select * from project2_customers;
select * from project2_orders;
select * from project2_products;


----------------------------------- Product Table ---------------------------------------
-----------------------------------------------------------------------------------------

--understanding prodcuts table
select * from project2_products;

select 
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'project2_products' -- product id datatype should be varchar

select * from project2_products


--product id must exist
select product_id from project2_products
where product_id is null


--product category must exist
select category from project2_products
where category is null


-- list price msut be greater than zero
select list_price from project2_products
where list_price < 0



----------------------------------- Customer Table ---------------------------------------
------------------------------------------------------------------------------------------

--understanding customers table
select * from project2_customers

select 
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'project2_customers' --phone's datatype should be varchar


--customer_id must exist
select customer_id from project2_customers
where customer_id is null


--customer_name cannot be null or blank
select customer_name from project2_customers
where customer_name is null     ------------172 null values

select customer_name from project2_customers
where customer_name = ''


--email must be valid
select email from project2_customers
where (email is null
	or email not like '%_@_%._%'
	or email like '% %'
	or email like '%@@%')   -------469 invalid emails


--age must between 18 to 100
select age from project2_customers
where not(age between 18 and 100)  -----161 invalid ages


--signup date must be valid
select signup_date  from project2_customers
where TRY_CONVERT(date, signup_date ) is null  --121 invalid dates



----------------------------------- Orders Table ----------------------------------------
-----------------------------------------------------------------------------------------

--understanding orders table
select * from project2_orders

select 
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'project2_orders' --prodcut id datatype must be 


--order_id must be unique
select order_id from project2_orders
where order_id is null

with duplicate as (
	select 
		order_id,
		ROW_NUMBER() over (
			partition by order_id order by (select null)
		) as rn
	from project2_orders
)
select * from duplicate
where rn > 1         --------------------- 3 invalid entries


--customer id must exist in customer table
select 
	*
from project2_orders
where customer_id not in (
	select customer_id 
	from project2_customers
	where customer_id is not null     -- 2015 invalid entires
)

--product id must exist in product table
select * 
from project2_products as a
left join project2_orders as b
on a.product_id = b.product_id
where b.order_amount is null 


--ordered date must be valid
select order_date from project2_orders
where TRY_CONVERT(date, order_date) is null  ------- 132 invalid entries


--order amount must be greater than 0
select order_amount from project2_orders
where order_amount < 0                  ----------------- 168 invalid entries


--Order Status must be Completed only
select * 
from project2_orders
where not (order_status = 'completed')  ---- 7308 invalid entries




