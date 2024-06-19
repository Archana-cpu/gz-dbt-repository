select
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    purchase_cost,
    margin,
    shipping_fee,
    logcost,
    ship_cost,
    ROUND(sm.margin + sh.shipping_fee - (sh.logcost + sh.ship_cost),2) AS operational_margin 
from {{ ref('int_orders_margin') }} sm
Join {{ ref('stg_raw__ship') }} sh
    using(orders_id)