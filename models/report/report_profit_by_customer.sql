{{
    config(
        materialized='table'
    )
}}

select customerid,customername,sum(orderprofit) as customerprofit
from {{ ref('stage_orders') }}
group by customerid,customername