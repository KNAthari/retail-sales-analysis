-- Import Data and CSV file --

-- Create Database --
CREATE DATABASE retail_project;

-- Create Table --
CREATE TABLE (
    sale_date DATE,
    category VARCHAR(50),
    sales_revenue NUMERIC(10,2),
    quantity INTEGER,
    profit NUMERIC(10,2),
    region VARCHAR(50)
);

-- Import csv file --
COPY retail_sales(sale_date, category, sales_revenue, quantity, profit, region)
FROM '/Users/kenyonnyangai/Downloads/SQL_Analysis_Project/data/retail_sales.csv'
DELIMITER ','
CSV HEADER;