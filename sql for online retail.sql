---Total number of invoices , unique customers , product categories 
SELECT COUNT ( DISTINCT ordernumber) as Total_invoices , 
COUNT ( DISTINCT customername) as Unique_customers ,
count ( DISTINCT productline) as product_categories
FROM sales_data_sample 

--- Unique Customers by Product Line and Product Code
SELECT COUNT(DISTINCT customername) AS UNIQUE_CUSTOMERS , productline , productcode FROM sales_data_sample
GROUP BY productline , productcode
ORDER BY UNIQUE_CUSTOMERS DESC

---total sales amount 
SELECT sum(sales) FROM sales_data_sample
where status != 'Cancelled' or 'Disputed' or 'On Hold'                                                   

--- average order value 
SELECT sum (sales) / COUNT(DISTINCT ordernumber) FROM sales_data_sample
where status != 'Cancelled' or 'Disputed' or 'On Hold' 

---most frequently purchased items
SELECT count ( productline) as Frequency , productline 
from sales_data_sample
group by productline
order by Frequency DESC 
 
 ---purchase patterns by country ( most 
 SELECT  country ,
 COUNT (DISTINCT ordernumber) as total_orders ,
 sum(sales) as total_sales , 
 avg ( quantityordered ) as avg_quantity_ordered , 
 productline
 from sales_data_sample
 group by country , productline
 order by total_sales DESC
 
--- Top 20 Cities by Total Sales for Each Product Line
SELECT  city , country ,
 COUNT (DISTINCT ordernumber) as total_orders ,
 sum(sales) as total_sales , 
 avg ( quantityordered ) as avg_quantity_ordered , productline
 from sales_data_sample
 group by city , productline
 order by total_sales  DESC
 LIMIT 20 
 
--- how many sub-category for each category  
SELECT COUNT(DISTINCT productcode) , productline FROM sales_data_sample
GROUP by productline

---most sold sub-category
 SELECT  productline, productcode ,  COUNT (DISTINCT ordernumber) as total_orders ,
 sum(sales) as total_sales 
 from sales_data_sample
 group by productcode
 order by total_sales DESC 
 
 