select
    date_date,
    SUM(ads_cost) as ads_cost,
    SUM(impression) as ads_impression,
    SUM(click) as ads_click
from {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC