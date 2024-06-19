select
    date_date, 
    COUNT(orders_id) as nb_transactions,
    ROUND(sum(revenue),0) as revenue, 
    ROUND(AVG(revenue),1) as average_basket,
    sum(margin) as margin,
    ROUND(sum(operational_margin),0) as operational_margin
from {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC