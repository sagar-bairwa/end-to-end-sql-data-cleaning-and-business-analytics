------------------------------------- 04_Product_Table_Cleaning -----------------------------------

use sql_project_ecommerce

--creating a backup table
select * into products  
from project2_products  --drop table products


---------------------------------------- Cleaning -------------------------------------------------
---------------------------------------------------------------------------------------------------

-- product id datatype should be varchar
alter table products
alter column product_id int

alter table products
alter column product_id varchar(50)


select * from products