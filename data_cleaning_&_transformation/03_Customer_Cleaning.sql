----------------------------------- 03_customer_table_cleaning ------------------------------------

use sql_project_ecommerce

--create a another table for bakcup
select * into customers   
from project2_customers   ----drop table customers




---------------------------------------- Cleaning -------------------------------------------------
---------------------------------------------------------------------------------------------------

--customer_name cannot be null or blank
delete from customers
where customer_name is null


--email must be valid
delete from customers
where (email is null
	or email not like '%_@_%._%'
	or email like '% %'
	or email like '%@@%') 


--age must between 18 to 100
delete from customers
where not(age between 18 and 100) 


--signup date must be valid
delete from customers
where TRY_CONVERT(date, signup_date ) is null


--phone's datatype should be varchar
alter table customers
alter column phone varchar(50)


select * from customers




