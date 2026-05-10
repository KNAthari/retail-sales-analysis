-- Data Exploration --

-- distribution of profit and revenue by category --
SELECT category, SUM(profit) AS profit
FROM retail_sales
GROUP BY category
ORDER BY profit DESC  

SELECT category, SUM(sales_revenue) AS sales_revenue
FROM retail_sales
GROUP BY category
ORDER BY sales_revenue DESC 

-- Profit and Revenue by region --
SELECT region, SUM(profit) AS profit
FROM retail_sales
GROUP BY region
ORDER BY profit DESC 

SELECT region, SUM(sales_revenue) AS revenue
FROM retail_sales
GROUP BY region
ORDER BY revenue DESC 

-- Quantity by category and region --
SELECT region, SUM(quantity) As quantity
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC 

SELECT category, SUM(quantity) As quantity
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC 



