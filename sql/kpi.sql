-- KPI'S as used in BI Dashboard

-- 1. Total Revenue
select sum(total_price) as Total_Revenue from order_items;

-- 2. Average Order Value
select sum(total_price)/count(distinct(order_id)) as Average_Order_Value from order_items;

-- 3. Total Pizzas Sold
select sum(quantity) as Total_Pizza_Sold from order_items;

-- 4. Total Orders
select count(distinct(order_id)) as Total_Orders from order_items;

-- 5. Aveage Pizzas Per Order
select cast((sum(quantity)/count(distinct(order_id))) as decimal(10,2)) as Average_Pizzas_Per_Order from order_items;

