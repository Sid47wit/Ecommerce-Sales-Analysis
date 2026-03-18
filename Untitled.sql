-- create database buisness_queries
-- use buisness_queries
Select * from Data limit 10;

select sum(Sales) as Total_sales From data;
Select sum(profit) as Total_profit from data;
SELECT Category, SUM(Sales) AS Total_sales
FROM Data
GROUP BY category
ORDER BY Total_sales DESC;

SELECT Customer_name, SUM(sales) AS total_spent
FROM Data
GROUP BY Customer_name
ORDER BY total_spent DESC
LIMIT 10;

Select Region, sum(profit) as Total_Profit
from data 
Group By region 
order by Total_Profit desc;

SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    SUM(sales) AS total_sales
FROM Data
GROUP BY month
ORDER BY month;

select Product_Name, sum(profit) as Total_profit
from data
group by Product_Name
Having Total_profit<0
order by Total_profit;

SELECT 
    Product_name,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) AS loss_orders
FROM Data
GROUP BY Product_name
HAVING loss_orders > 0
ORDER BY loss_orders DESC;

SELECT 
    Product_name,
    SUM(profit) AS total_profit,
    COUNT(*) AS total_orders
FROM Data
GROUP BY Product_name
HAVING total_profit < 0
AND total_orders > 5
ORDER BY total_profit;

SELECT Discount, AVG(profit) AS avg_profit
FROM Data
GROUP BY Discount
ORDER BY Discount;

SELECT 
    Category,
    SUM(profit) / SUM(sales) AS profit_ratio
FROM Data
GROUP BY Category
ORDER BY profit_ratio DESC;

SELECT 
    Customer_Name,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS rank_
FROM Data
GROUP BY Customer_Name;

SELECT 
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS order_count
FROM Data
GROUP BY Customer_Name
HAVING order_count > 1
ORDER BY order_count DESC;

SELECT 
    Order_ID,
    SUM(sales) AS order_value
FROM Data
GROUP BY Order_ID;



