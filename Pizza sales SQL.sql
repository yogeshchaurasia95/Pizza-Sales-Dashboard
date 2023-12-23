USE PIZZA_DB;
SELECT * FROM PIZZA_SALES;

-- KPI's
-- 1. TOTAL REVENUE
SELECT SUM(total_price)  AS Total_revenue FROM pizza_sales;

-- 2. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value FROM pizza_sales;

-- 3. Total Pizza Sold
SELECT SUM(quantity) as Total_pizza_sold from pizza_sales;

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales;

-- 5. AVG. pizza per order
SELECT CAST(SUM(quantity) / COUNT(DISTINCT ORDER_ID) AS DECIMAL(10,2))
AS Avg_pizza_per_order FROM pizza_sales;

------------------------------------------------------------------------------------------------
-- Charts 

-- 1. Daily trend for orders
SELECT DAYNAME(STR_TO_DATE(ORDER_DATE, '%d-%m-%Y')) AS Order_day , 
COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY Order_day;

-- 2. Monthly trend for orders

SELECT MONTHNAME(STR_TO_DATE(ORDER_DATE, '%d-%m-%Y')) AS Month, 
Count(DISTINCT order_id) AS Total_orders From Pizza_sales
GROUP BY Month 
ORDER BY Total_orders DESC;

SELECT * FROM PIZZA_SALES;

-- HOW MANY PIZZA'S HAS BEEN ORDERED BY INDIVIDUAL CUSTOMER?
SELECT ORDER_ID, GROUP_CONCAT(PIZZA_NAME_ID ORDER BY PIZZA_NAME_ID ASC SEPARATOR ', ') 
AS ORDERS 
FROM PIZZA_SALES
GROUP BY ORDER_ID;




