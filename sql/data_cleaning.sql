-- Data Cleaning & Validation --


-- Find rows with missing values -
SELECT *
FROM retail_sales
WHERE category IS NULL
   OR sales_revenue IS NULL
   OR quantity IS NULL
   OR profit IS NULL
   OR region IS NULL;

-- Replace Null values with Unknown in category --
UPDATE retail_sales
SET category = 'Unknown'
WHERE category IS NULL 
OR category = 'Nan' 
OR category = '?'

-- Replace Null values with Unknown in region
UPDATE retail_sales
SET region = 'Unknown'
WHERE region IS NULL

-- Find median for sales_revenue --
SELECT category, percentile_cont(0.5) WITHIN GROUP (
    ORDER BY sales_revenue
) AS median_revenue
FROM retail_sales
GROUP BY category


-- fill missing sales_revenue value with median --
UPDATE retail_sales
SET sales_revenue = 1037.47
WHERE category = 'Electronics' & sales_revenue IS NULL

UPDATE retail_sales
SET sales_revenue = 985.04
WHERE category = 'Sports' & sales_revenue IS NULL

-- Find median value for quantity by category --
SELECT category, percentile_cont(0.5) WITHIN GROUP (
    ORDER BY quantity
) AS median_quantity
FROM retail_sales
GROUP BY category

-- Verify cleaning results --
SELECT *
FROM retail_sales
WHERE category IS NULL
OR sales_revenue IS NULL
OR quantity IS NULL
OR profit IS NULL
OR region IS NULL



