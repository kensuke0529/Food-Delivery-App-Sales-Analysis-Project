-- average revenue per user
select 
    SUM(m.meal_price * o.order_quantity) as total_revenue,
    COUNT(DISTINCT o.user_id) as total_users,
    ROUND(
        SUM(m.meal_price * o.order_quantity) :: numeric / COUNT(DISTINCT o.user_id)
        ,2) as ARPU
FROM meals as m  
JOIN orders as o 
ON m.meal_id = o.meal_id

-- ARPU by month
WITH arpu as(
    SELECT 
        DATE_TRUNC('month',order_date) as month,
        SUM(m.meal_price * o.order_quantity) as total_revenue,
        COUNT(DISTINCT o.user_id) as total_users,
        ROUND(
            SUM(m.meal_price * o.order_quantity) :: numeric / COUNT(DISTINCT o.user_id)
            ,2) as ARPU
    FROM meals as m  
    JOIN orders as o 
    ON m.meal_id = o.meal_id
    group BY DATE_TRUNC('month',o.order_date)
)
SELECT 
    month,
    ARPU
FROM arpu
ORDER BY month;


-- ARPU by week
WITH arpu as(
    SELECT 
        DATE_TRUNC('week',order_date) as week,
        SUM(m.meal_price * o.order_quantity) as total_revenue,
        COUNT(DISTINCT o.user_id) as total_users,
        ROUND(
            SUM(m.meal_price * o.order_quantity) :: numeric / COUNT(DISTINCT o.user_id)
            ,2) as ARPU
    FROM meals as m  
    JOIN orders as o 
    ON m.meal_id = o.meal_id
    group BY DATE_TRUNC('week',o.order_date)
)
SELECT 
    week,
    ARPU
FROM arpu
ORDER BY week;
