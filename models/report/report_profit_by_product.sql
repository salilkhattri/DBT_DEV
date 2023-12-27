{{
    config(
        materialized='table'
    )
}}

select productid,productname,sum(orderprofit) as productprofit
from {{ ref('stage_orders') }}
group by productid,productname