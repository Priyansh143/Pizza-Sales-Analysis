-- Staging Table Creation 
CREATE TABLE pizza_sales_raw (
    row_id INT, order_id INT, pizza_name_id VARCHAR(50), quantity INT, order_date VARCHAR(20), order_time VARCHAR(20),
    unit_price DECIMAL(6,2), total_price DECIMAL(8,2), pizza_size VARCHAR(10), pizza_category VARCHAR(50), pizza_ingredients TEXT, pizza_name VARCHAR(100) );

-- Bulk Data Load
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pizza_sales.csv'
INTO TABLE pizza_sales_raw FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;



--  Orders Table Creation
CREATE TABLE orders (
    order_id INT PRIMARY KEY,  order_date DATE, order_time TIME );
    
-- Orders Table Data Population
INSERT INTO orders (order_id, order_date, order_time)
SELECT DISTINCT
    CAST(order_id AS UNSIGNED),
    CASE
        WHEN order_date LIKE '%-%'
            THEN STR_TO_DATE(order_date, '%d-%m-%Y')
        WHEN order_date LIKE '%/%'
            THEN STR_TO_DATE(order_date, '%d/%m/%Y')
    END,
    STR_TO_DATE(order_time, '%h:%i:%s %p')
FROM pizza_sales_raw;


-- Pizzas Table Creation
CREATE TABLE pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,
    pizza_name VARCHAR(100), pizza_category VARCHAR(50),
    pizza_size VARCHAR(10), unit_price DECIMAL(6,2),
    pizza_ingredients TEXT );

-- Pizzas Table Data Population
INSERT INTO pizzas (
    pizza_id, pizza_name, pizza_category, pizza_size, unit_price, pizza_ingredients
)
SELECT
    pizza_name_id, MIN(TRIM(pizza_name)),
 MIN(TRIM(pizza_category)), MIN(TRIM(pizza_size)),
 CAST(MIN(unit_price) AS DECIMAL(6,2)), MIN(TRIM(pizza_ingredients))
FROM pizza_sales_raw GROUP BY pizza_name_id;


-- Order Items Table Creation
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT, pizza_id VARCHAR(50), quantity INT, total_price DECIMAL(8,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id), FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id) );

-- Order Items Data Population
INSERT INTO order_items (order_id, pizza_id, quantity, total_price)
SELECT
    CAST(order_id AS UNSIGNED), pizza_name_id,
    CAST(quantity AS UNSIGNED), CAST(total_price AS DECIMAL(8,2))
FROM pizza_sales_raw;


-- Final Data Consistency check 
SELECT
    (SELECT COUNT(*) FROM pizza_sales_raw) AS raw_rows,
    (SELECT COUNT(*) FROM orders) AS orders,
    (SELECT COUNT(*) FROM pizzas) AS pizzas,
    (SELECT COUNT(*) FROM order_items) AS order_items;

