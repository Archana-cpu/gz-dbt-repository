SELECT
    date_date, 
    sum(revenue) as revenue,
    sum(average_basket) as average_basket,
    sum(margin) as margin,
    ROUND(sum(operational_margin - ads_cost), 0) AS ads_margin
FROM 
    {{ ref('int_campaigns_day') }} 
JOIN 
        {{ ref('finance_days') }}
USING 
    (date_date)
GROUP BY 
    date_date
ORDER BY 
    date_date DESC