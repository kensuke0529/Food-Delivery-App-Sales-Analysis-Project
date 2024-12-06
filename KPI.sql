-- registration by each month
WITH reg_dates as (
    SELECT 
        user_id,
        MIN(order_date) as reg_date
    FROM orders
    GROUP BY user_id
)
SELEC
    DATE_TRUNC('month', reg_date) as month,
    COunt( user_id) as reg_number
FROM reg_dates
GROUP BY month
ORDER BY month ASC;

-- Stickiness (DAU / MAU)

