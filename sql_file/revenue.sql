-- dataset are meals, stock, orders

SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'orders';

select * FROM orders LIMIT 4;

-- revenue by meal_id
SELECT 
    m.meal_id,
    SUM(m.meal_price * o.order_quantity) as revenue
FROM meals as m 
JOIN orders as o
ON m.meal_id = o.meal_id
GROUP BY m.meal_id
ORDER BY revenue DESC;


-- revenue by month
SELECT 
    date_Trunc('month',o.order_date) as month,
    SUM(m.meal_price * o.order_quantity) as revenue
FROM meals as m 
JOIN orders as o
ON m.meal_id = o.meal_id
GROUP BY month
ORDER BY month ASC;

-- revenue by week
SELECT 
    date_Trunc('week',o.order_date) as week,
    SUM(m.meal_price * o.order_quantity) as revenue
FROM meals as m 
JOIN orders as o
ON m.meal_id = o.meal_id
GROUP BY week
ORDER BY week ASC;

-- cost b meal_id
SELECT
    m.meal_id,
    SUM(s.stocked_quantity * m.meal_cost) as cost
FROM meals as m 
JOIN stock as s 
ON m.meal_id = s.meal_id
GROUP BY m.meal_id 
ORDER BY cost DESC;

-- profit by meal_id
WITH revenue as (
    SELECT 
        m.meal_id,
        SUM(m.meal_price * o.order_quantity) as revenue
    FROM meals as m 
    JOIN orders as o
    ON m.meal_id = o.meal_id
    GROUP BY m.meal_id
), 
cost as (
    SELECT
        m.meal_id,
        SUM(s.stocked_quantity * m.meal_cost) as cost
    FROM meals as m 
    JOIN stock as s 
    ON m.meal_id = s.meal_id
    GROUP BY m.meal_id 
)
SELECT 
    r.meal_id,
    r.revenue,
    c.cost,
    r.revenue - c.cost as profit
FROM revenue as r
JOIN cost as c 
ON r.meal_id = c.meal_id
ORDER BY profit DESC;


-- profit by each week
-- profit by meal_id
WITH revenue AS (
    SELECT 
        date_trunc('week', o.order_date) AS week,
        SUM(m.meal_price * o.order_quantity) AS revenue
    FROM meals AS m
    JOIN orders AS o
    ON m.meal_id = o.meal_id
    GROUP BY week
), 
cost AS (
    SELECT
        date_trunc('week',  o.order_date) AS week,
        SUM(o.order_quantity * m.meal_cost) AS cost
    FROM meals AS m
    JOIN orders AS o
    ON m.meal_id = o.meal_id
    GROUP BY week
)
SELECT 
    r.week,
    r.revenue,
    c.cost,
    r.revenue - c.cost AS profit
FROM revenue AS r
JOIN cost AS c
ON r.week = c.week
ORDER BY r.week DESC;

-- profit by each item
/* 
WITH revenue AS (
    SELECT 
        m.meal_id,
        SUM(m.meal_price * o.order_quantity) AS revenue
    FROM meals AS m
    JOIN orders AS o
    ON m.meal_id = o.meal_id
    GROUP BY m.meal_id
), 
cost AS (
    SELECT
        m.meal_id,
        SUM(o.order_quantity * m.meal_cost) AS cost
    FROM meals AS m
    JOIN orders AS o
    ON m.meal_id = o.meal_id
    GROUP BY m.meal_id
)
SELECT 
    r.meal_id,
    r.revenue,
    c.cost,
    r.revenue - c.cost AS profit,
    (r.revenue - c.cost) /  COunt(*) as per_profit
FROM revenue AS r
JOIN cost AS c
ON r.meal_id = c.meal_id
ORDER BY r.meal_id DESC;
*/


WITH revenue AS (
    SELECT 
        m.meal_id,
        SUM(m.meal_price * o.order_quantity) AS revenue,
        SUM(o.order_quantity) AS total_quantity -- Total quantity ordered per meal_id
    FROM meals AS m
    JOIN orders AS o
    ON m.meal_id = o.meal_id
    GROUP BY m.meal_id
), 
cost AS (
    SELECT
        m.meal_id,
        SUM(o.order_quantity * m.meal_cost) AS cost
    FROM meals AS m
    JOIN orders AS o
    ON m.meal_id = o.meal_id
    GROUP BY m.meal_id
)
SELECT 
    r.meal_id,
    r.revenue,
    c.cost,
    r.revenue - c.cost AS profit,
    r.total_quantity,
    (r.revenue - c.cost) / r.total_quantity AS per_profit -- Profit per unit sold
FROM revenue AS r
JOIN cost AS c
ON r.meal_id = c.meal_id
ORDER BY r.meal_id;

