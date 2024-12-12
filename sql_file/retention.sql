-- retention rate
WITH user_monthly_activity AS (
  SELECT DISTINCT
    DATE_TRUNC('month', order_date) :: DATE AS month,
    user_id
  FROM orders)

SELECT
  previous.month,
  ROUND(
    COUNT(distinct current.user_id) :: numeric /
    GREATEST(COUNT(DISTINCT previous.user_id), 1), -- avoid dividing by 0 
  2) AS retention_rate
FROM user_monthly_activity AS previous
LEFT JOIN user_monthly_activity AS current
ON current.user_id = previous.user_id
AND previous.month = (current.month -INTERVAL'1 month')
GROUP BY previous.month
ORDER BY previous.month ASC;

-- weekly
WITH user_weekly_activity AS (
  SELECT DISTINCT
    DATE_TRUNC('week', order_date) :: DATE AS week,
    user_id
  FROM orders)

SELECT
  previous.week,
  ROUND(
    COUNT(distinct current.user_id) :: numeric /
    GREATEST(COUNT(DISTINCT previous.user_id), 1), -- avoid dividing by 0 
  2) AS retention_rate
FROM user_weekly_activity AS previous
LEFT JOIN user_weekly_activity AS current
ON current.user_id = previous.user_id
AND previous.week = (current.week -INTERVAL'1 week')
GROUP BY previous.week
ORDER BY previous.week ASC;