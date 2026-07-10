---------------------------------06_Data_Validation-------------------------------------

use sql_project_ecommerce

select * from customers;
select * from orders;
select * from products;

---------------------------------- customer table --------------------------------------
----------------------------------------------------------------------------------------
                              select * from customers;

--customer_name cannot be null or blank
select 
	'null_customer_name' as Issue,
	count(*) as invalid_entries
from customers
where customer_name is null

union all

--email must be valid
select 
	'invalid_email', 
	count(*) as Invalid_Entries
from customers
where (email is null
	or email not like '%_@_%._%'
	or email like '% %'
	or email like '%@@%') 
	
union all

--age must between 18 to 100
select 
	'invalid_age',
	count(*) as Invalid_Entries
from customers
where not(age between 18 and 100) 

union all

--signup date must be valid
select 
	'invalid_signup_date',
	count(*) as Invalid_Entries
from customers
where TRY_CONVERT(date, signup_date ) is null



---------------------------------- order table --------------------------------------
-------------------------------------------------------------------------------------
                              select * from orders;

--Duplicate order id
with duplicate as (
	select 
		order_id,
		ROW_NUMBER() over (
			partition by order_id order by (select null)
		) as rn
	from orders
)
select 
	'Duplicate order id' as Issues,
	count(*) as Invalid_Entries
from duplicate
where rn > 1

Union all

--customer id must exist in customer table
select 
	'Invalid customer Id',
	count(*) as Invalid_Entries
from orders
where customer_id not in (
	select customer_id 
	from customers
	where customer_id is not null
)                           

Union all

--ordered date must be valid
select 
	'Invalid Order Date',
	count(*) as Invalid_Entries
from orders
where TRY_CONVERT(date, order_date) is null  

Union all

--order amount must be greater than 0
select 
	'Invalid Order Amount',
	count(*) as Invalid_Entries
from orders
where order_amount < 0 

Union all

--Order Status must be Completed only
select 
	'Non_completed Entries',
	count(*) as Invalid_Entries
from orders
where not (order_status = 'completed')


---------------------------------- Product Table ----------------------------------------
-----------------------------------------------------------------------------------------
                                 select * from products;

--product id must exist
select 
	'Null_Product_ID' as Issues,
	count(*) as Invalid_entries
from products
where product_id is null

Union all

--product category must exist
select 
	'Null_Product_Category' as Issues,
	count(*) as Null_values 
from products
where category is null

Union all

-- list price msut be greater than zero
select 
	'Invalid Price' as Issues,
	count(*) as Invalid_values
from products
where list_price < 0



