------------------------------------- 02 Data_Quality ----------------------------------

use sql_project_ecommerce

select * from project2_customers;
select * from project2_orders;
select * from project2_products;

---------------------------------- customer table --------------------------------------
----------------------------------------------------------------------------------------
                            select * from project2_customers;

--customer_name cannot be null or blank
select 
	'null_customer_name' as Issue,
	count(*) as invalid_entries
from project2_customers
where customer_name is null       ----- 172 null customer names

union all

--email must be valid
select 
	'invalid_email', 
	count(*) as invalid_email
from project2_customers
where (email is null
	or email not like '%_@_%._%'
	or email like '% %'
	or email like '%@@%')        ------- 469 Invalid emails
	
union all

--age must between 18 to 100
select 
	'invalid_age',
	count(*)
from project2_customers
where not(age between 18 and 100) ------ 161 invalid age

union all

--signup date must be valid
select 
	'invalid_signup_date',
	count(*)
from project2_customers
where TRY_CONVERT(date, signup_date ) is null --- 121 invalid signup dates



---------------------------------- order table --------------------------------------
-------------------------------------------------------------------------------------
                              select * from project2_orders;

--Duplicate order id
with duplicate as (
	select 
		order_id,
		ROW_NUMBER() over (
			partition by order_id order by (select null)
		) as rn
	from project2_orders
)
select 
	'Duplicate order id' as Issues,    ------------- 3 duplicate order IDs
	count(*) as Invalid_Entries
from duplicate
where rn > 1                  

Union all

--customer id must exist in customer table
select 
	'Invalid customer Id',
	count(*) as Invalid_Entries
from project2_orders                   ------------- 148 Invalid customer IDs
where customer_id not in (
	select customer_id 
	from project2_customers
	where customer_id is not null
)                            

Union all

--ordered date must be valid
select 
	'Invalid Order Date',
	count(*) as Invalid_Entries        ---------------- 132 Invalid Order date
from project2_orders
where TRY_CONVERT(date, order_date) is null  

Union all

--order amount must be greater than 0
select 
	'Invalid Order Amount',
	count(*) as Invalid_Entries        ---------------- 168 Invalid ordered amounts
from project2_orders
where order_amount < 0         

Union all

--Order Status must be Completed only
select 
	'Non_completed Orders',           ----------------  7458 Orders Not completed
	count(*) as Invalid_Entries
from project2_orders
where not (order_status = 'completed')



----------------------------------- Product Table ---------------------------------------
-----------------------------------------------------------------------------------------
                           select * from project2_products


--product id must exist
select 
	'Null_Product_ID' as Issues,
	count(*) as Invalid_entries
from project2_products
where product_id is null

Union all

--product category must exist
select 
	'Null_Product_Category' as Issues,
	count(*) as Null_values 
from project2_products
where category is null

Union all

-- list price msut be greater than zero
select 
	'Invalid Price' as Issues,
	count(*) as Invalid_values
from project2_products
where list_price < 0




---------------------------------- Data type Issues --------------------------------------
-------------------------------------------------------------------------------------

--orders table
select 
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'project2_orders' --product_id datatype should be varchar


--product table
select 
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'project2_products' -- product id datatype should be varchar


--customers table
select 
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'project2_customers' --phone's datatype should be varchar


