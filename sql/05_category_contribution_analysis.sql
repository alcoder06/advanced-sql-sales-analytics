-- 04_category_contribution_analysis.sql
-- Part-to-Whole Analysis (Category Contribution to Total Sales)

with category_sales as (
    select	category,
		        sum(sales_amount)  as sales_by_category
    from gold.fact_sales s
    join gold.dim_products p on s.product_key = p.product_key
    group by category)

select	category,
		    sales_by_category,
		    sum(sales_by_category) over () as total,
		    concat(round((cast(sales_by_category as float) / sum(sales_by_category) over ())*100,2), '%') as percentage_of_total
from category_sales
order by sales_by_category desc;
