WITH recent_orders AS (
    SELECT DISTINCT
        o.customer_id
    FROM orders o
    WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 days'
),

all_customers AS (
    SELECT 
        c.id,
        c.name,
        c.city
    FROM customers c
),

inactive_customers AS (
    SELECT 
        ac.id,
        ac.name,
        ac.city
    FROM all_customers ac
    LEFT JOIN recent_orders ro
        ON ac.id = ro.customer_id
    WHERE ro.customer_id IS NULL
)

SELECT *
FROM inactive_customers
ORDER BY name;
