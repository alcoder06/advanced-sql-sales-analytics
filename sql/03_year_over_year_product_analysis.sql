-- 03_year_over_year_product_analysis.sql
-- Year-over-Year Product Performance Analysis

with yearly_product_sales as (
select  year(s.order_date) as order_year,
        p.product_name as product_name,
        sum(s.sales_amount) as total_sales
from gold.fact_sales s 
left join gold.dim_products p on s.product_key = p.product_key
where year(order_date) is not null
group by year(order_date), product_name)

select  order_year, 
        product_name, 
        total_sales,
        -- avg performence analysis
        avg(total_sales) over (partition by product_name) as avg_sales,
        total_sales - avg(total_sales) over (partition by product_name) as diff_avg,
        case when total_sales - avg(total_sales) over (partition by product_name)  > 0 then 'above average' 
             when total_sales - avg(total_sales) over (partition by product_name)  < 0 then 'below average'
            else 'avg' 
        END avg_change,
        -- year over year analysis
        lag(total_sales) over (partition by product_name order by order_year) as py_sales,
        total_sales - lag(total_sales) over (partition by product_name order by order_year) as diff_py, 
        case when total_sales - lag(total_sales) over (partition by product_name order by order_year) > 0 then 'increasing'
             when total_sales - lag(total_sales) over (partition by product_name order by order_year) < 0 then 'decreasing'
            else 'no change'
        END py_change
from yearly_product_sales
order by product_name, order_year;
