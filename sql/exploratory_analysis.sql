-- Data Exploration --

-- Number of Rows --
SELECT COUNT(*) AS number_of_rows
FROM retail_sales 


-- data range of the dataset --
SELECT MIN(sale_date) AS earliest_date_of_transaction,
MAX(sale_date) AS latest_date_of_transaction
FROM retail_sales 

-- Outliers of profit, revenue, and quantity sold --
SELECT MAX(sales_revenue) AS max_revenue, 
MIN(sales_revenue) AS min_revenue,
MAX(profit) AS max_profit,
MIN(profit) AS min_profit,
MAX(quantity) AS max_quantity_sold,
MIN(quantity) AS min_quantity_sold
FROM retail_sales 

-- distribution of profit and revenue by category --
SELECT category, 
SUM(profit) AS profit, 
SUM(sales_revenue) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY category DESC 

-- Profit and Revenue by region --
SELECT region, 
SUM(profit) AS profit,
SUM(sales_revenue) AS revenue
FROM retail_sales
GROUP BY region
ORDER BY region DESC 

-- Quantity by category and region --

SELECT region, SUM(quantity) As quantity
FROM retail_sales
GROUP BY region
ORDER BY quantity DESC 

SELECT category, SUM(quantity) As quantity
FROM retail_sales
GROUP BY category
ORDER BY quantity DESC 

-- Monthly profit trends --
SELECT DATE_TRUNC('month', sale_date) AS month, 
region, 
SUM(sales_revenue) AS revenue,
SUM(profit) AS profit,
SUM(quantity) AS quantity
FROM retail_sales
GROUP BY month, region
ORDER BY month, region DESC 

-- profit margins by category --
SELECT category,
SUM(sales_revenue) AS revenue,
SUM(profit) AS profit,
ROUND((SUM(profit)/SUM(sales_revenue)) * 100, 2) AS profit_margin
FROM retail_sales
GROUP BY category
ORDER BY profit_margin DESC

-- profit margins by region --
SELECT region,
ROUND((SUM(profit)/SUM(sales_revenue)) * 100, 2) AS profit_margin
FROM retail_sales
GROUP BY region
ORDER BY profit_margin DESC 

-- Average profit and revenue by category --
SELECT category,
COUNT(*) AS transaction_count,
ROUND(AVG(profit), 2) AS average_profit,
ROUND(AVG(sales_revenue), 2) AS average_revenue
FROM retail_sales
GROUP BY category

-- Average profit and revenue by region --
SELECT region,
COUNT(*) AS transaction_count,
ROUND(AVG(profit), 2) AS average_profit,
ROUND(AVG(sales_revenue), 2) AS average_revenue
FROM retail_sales
GROUP BY region
