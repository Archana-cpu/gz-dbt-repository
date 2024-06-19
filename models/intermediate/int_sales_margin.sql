select
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchase_price AS FLOAT64), 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin
from {{ ref('stg_raw__sales') }} s
Join {{ ref('stg_raw__product') }} p
    using(products_id)