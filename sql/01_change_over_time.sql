-- 01_change_over_time.sql
-- Yearly Sales Performance Analysis

select  year(order_date) as order_year, 
        sum (sales_amount) as total_sales,
        count(distinct(customer_key)) as total_customer,
        sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by year(order_date)
order by year(order_date);
