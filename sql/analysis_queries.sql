-- Queries for analysis and cross checking of values displayes in BI dashboards.

-- 1. DAILY TREND FOR TOTAL ORDERS
select dayname(order_date) as Weekdays, count(order_id) as Total_orders from orders group by Weekdays;


-- 2.	HOURLY TREND FOR TOTAL ORDERS
select hour(order_time) as order_hour, count(order_id) as Total_orders from orders group by order_hour order by order_hour;


-- 3.	PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT
    p.pizza_category,
    ROUND(SUM(oi.total_price), 2)
 AS category_revenue,
    ROUND(
        SUM(oi.total_price) * 100.0 
        / SUM(SUM(oi.total_price)) OVER (),
        2
    ) AS revenue_percentage
FROM order_items oi
JOIN pizzas p
    ON oi.pizza_id = p.pizza_id
GROUP BY p.pizza_category
ORDER BY category_revenue DESC;


-- 4.	PERCENTAGE OF SALES BY PIZZA SIZE
SELECT
    p.pizza_size,
    ROUND(SUM(oi.total_price), 2) AS size_revenue,
    ROUND(
        SUM(oi.total_price) * 100.0 /
        SUM(SUM(oi.total_price)) OVER (),
        2
    ) AS revenue_percentage
FROM order_items oi
JOIN pizzas p
    ON oi.pizza_id = p.pizza_id
GROUP BY p.pizza_size
ORDER BY size_revenue DESC;


-- 5.	TOTAL PIZZAS SOLD BY PIZZA CATEGORY
SELECT
    p.pizza_category,
    SUM(oi.quantity) AS total_pizzas_sold
FROM order_items oi
JOIN pizzas p
    ON oi.pizza_id = p.pizza_id
GROUP BY p.pizza_category
ORDER BY total_pizzas_sold DESC;


-- 6.	TOP 5 BEST SELLING PIZZAS
SELECT
    p.pizza_name,
    SUM(oi.quantity) AS total_pizzas_sold
FROM order_items oi
JOIN pizzas p
    ON oi.pizza_id = p.pizza_id
GROUP BY p.pizza_name
ORDER BY total_pizzas_sold DESC
LIMIT 5;


-- 7.	BOTTOM 5 WORSE SELLING PIZZAS
SELECT
    p.pizza_name,
    SUM(oi.quantity) AS total_pizzas_sold
FROM order_items oi
JOIN pizzas p
    ON oi.pizza_id = p.pizza_id
GROUP BY p.pizza_name
ORDER BY total_pizzas_sold ASC
LIMIT 5;



