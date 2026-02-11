-- 05_customer_segmentation_summary.sql
-- Customer Segmentation Performance Summary

-- Step 1: Calculate customer lifespan and total spending
with lifespan as (
select  c.customer_key, 
		    max(order_date) as last_order,
		    min(order_date) as first_order,
		    DATEDIFF(month,min(order_date), max(order_date)) as lifespan,
		    sum(f.sales_amount) as total_spending
from gold.dim_customers c 
join gold.fact_sales f on c.customer_key = f.customer_key
group by c.customer_key),
-- Step 2: Assign customer segment
segmented as (
select  customer_key,
		    lifespan,
		    total_spending,
		    case when (lifespan>12) and (total_spending>5000) then 'VIP'
				     when (lifespan>12) and (total_spending<5000) then 'Regular'
				  else 'New'
		    end segment
from lifespan)
-- Step 3: Segment-level performance summary
select   segment, 
		    count(customer_key) as total_customers,
		    sum(total_spending) as total_spending
from segmented
group by segment;
