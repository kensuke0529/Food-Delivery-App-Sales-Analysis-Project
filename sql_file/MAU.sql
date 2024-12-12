-- registration by each month
WITH reg_dates as (
    SELECT 
        user_id,
        MIN(order_date) as reg_date
    FROM orders
    GROUP BY user_id
)
SELECT
    DATE_TRUNC('month', reg_date) as month,
    COunt( user_id) as reg_number
FROM reg_dates
GROUP BY month
ORDER BY month ASC;

--MAU growth rate
WITH mau AS (
  SELECT
    DATE_TRUNC('month', order_date) :: DATE AS month,
    COUNT(DISTINCT user_id) AS mau
  FROM orders
  GROUP BY month),

mau_with_lag AS (
  SELECT
    month,
    mau,
    GREATEST(LAG(mau) OVER (ORDER BY month ASC),1) AS last_mau
  FROM mau)

SELECT
  month,
  ROUND((mau - last_mau):: numeric/ last_mau ,2) AS growth_rate
FROM mau_with_lag
ORDER BY month;
