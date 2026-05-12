-- Data Exploration --

-- Number of Rows --
SELECT COUNT(*) AS number_of_rows
FROM retail_sales 



-- data range of the dataset --
SELECT MIN(sale_date) AS earliest_date_of_transaction,
MAX(sale_date) AS latest_date_of_transaction
FROM retail_sales 

/* The observation period of the dataset is from January 1st, 2023 to December 31st, 2023 */

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
GROUP BY 1 
ORDER BY 1 DESC 

/* Books and sports are the top two profit generaters, profits are evenly distributed (exception of Unknown & Home Goods) 
while books and electronics are the top two generators of revenue, sports is #2 in profit but drops to #4 in revenue  */ 

-- Profit and Revenue by region --
SELECT region, 
SUM(profit) AS profit,
SUM(sales_revenue) AS revenue
FROM retail_sales
GROUP BY 1
ORDER BY 1 DESC 

-- Quantity by category and region --

SELECT region, SUM(quantity) As quantity
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC 

SELECT category, SUM(quantity) As quantity
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC 

-- Monthly profit trends --
SELECT DATE_TRUNC('month', sale_date) AS month, 
region, 
SUM(sales_revenue) AS revenue,
SUM(profit) AS profit,
SUM(quantity) AS quantity
FROM retail_sales
GROUP BY 1, 2
ORDER BY 1, 2 DESC 

-- profit margins by category --
SELECT category,
SUM(sales_revenue) AS revenue,
SUM(profit) AS profit,
ROUND(SUM(sales_revenue)/SUM(profit), 2) AS profit_margin
FROM retail_sales
GROUP BY 1
ORDER BY 4 DESC 

-- Average profit and revenue by category --
SELECT category,
ROUND(AVG(profit), 2) AS average_profit,
ROUND(AVG(sales_revenue), 2) AS average_revenue
FROM retail_sales
GROUP BY 1 
