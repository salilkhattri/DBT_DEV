{{
    config(
        materialized='view'
    )
}}

--orderid,customerid,productid,ordedate,sellingprice,costprice,
--customerid,customername,city,
--productid,productname,category,subcategory

select 
o.orderid,o.customerid,o.productid,o.ordedate,o.sellingprice,o.costprice,o.sellingprice-o.costprice as orderprofit,
c.customername,c.city,
p.productname,p.category,p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid=c.customerid
left join {{ ref('raw_products') }} as p 
on o.productid=p.productid