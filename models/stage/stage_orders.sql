{{
    config(
        materialized='view'
    )
}}

--orderid,customerid,productid,ordedate,sellingprice,costprice,
--customerid,customername,city,
--productid,productname,category,subcategory

select *, sellingprice-costprice as profit from {{ ref('raw_orders') }}
