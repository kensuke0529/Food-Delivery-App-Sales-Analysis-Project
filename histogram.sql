-- histogram of orders per user
WITH order_count as (
    select 
        user_id,
        COUNT(distinct order_id ) as orders 
    from orders 
    group by user_id
)
select 
    orders,
    COUNT(user_id) as users
from order_count
group by orders
ORDER BY orders;

-- bucketing
with user_revenue as (
    select
        o.user_id,
        SUM(m.meal_price * o.order_quantity) as revenue 
    from meals as m 
    join orders as o 
    on m.meal_id = o.meal_id
    GROUP BY o.user_id
)
SELECT
    case
     when revenue < 150 then 'Low-revenue'
     when revenue < 250 then 'Mid-revenue'
     else 'High-revenue'
    end as grouped_revenue,
    COUNT(distinct user_id) as users 
from user_revenue 
GROUP BY grouped_revenue
