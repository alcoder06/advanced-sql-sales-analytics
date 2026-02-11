# Advanced SQL Sales Analytics & Customer Segmentation

## 📊 Project Overview

This project demonstrates advanced SQL analytics techniques applied to a retail sales dataset using a star-schema structure:

- `fact_sales`
- `dim_customers`
- `dim_products`

The objective is to simulate real-world business intelligence analysis by building analytical queries and reporting layers that support strategic decision-making.

---

## 🧱 Data Model

The project is based on a dimensional model:

- **fact_sales** → transactional sales data  
- **dim_customers** → customer attributes  
- **dim_products** → product details & categories  

This structure mirrors how data warehouses are designed in production environments.

---

## 🎯 Business Questions Answered

- How do total sales evolve over time?
- What is the cumulative revenue growth?
- What are the moving average trends?
- Which products are increasing or decreasing Year-over-Year?
- What percentage of revenue does each category contribute?
- How can customers be segmented based on lifespan and spending?
- What is customer lifetime value and recency?

---

## 📈 Analysis Included

### 1️⃣ Change Over Time
- Yearly sales performance
- Customer growth
- Quantity trends

### 2️⃣ Running Total & Moving Average
- Cumulative revenue using window functions
- Rolling 3-period moving average

### 3️⃣ Year-over-Year Product Analysis
- Average performance comparison per product
- Previous year comparison using `LAG`
- YoY growth classification (Increasing / Decreasing / No Change)

### 4️⃣ Category Contribution (Part-to-Whole Analysis)
- Total sales by category
- Percentage contribution to overall revenue
- Revenue concentration analysis

### 5️⃣ Customer Segmentation Summary
- Customer lifespan calculation
- Total spending aggregation
- Segment classification (VIP / Regular / New)
- Segment-level revenue & average spending

### 6️⃣ Customer Reporting View
- Business-ready reporting layer (`CREATE VIEW`)
- Age categorization
- Recency calculation
- Average order value
- Average monthly spend
- Customer segmentation logic

---

## 🛠 SQL Techniques Used

- Common Table Expressions (CTEs)
- Window Functions (`SUM() OVER`, `AVG() OVER`, `LAG()`)
- PARTITION BY
- Analytical Aggregations
- CASE-based Business Logic
- Date Functions (`YEAR`, `DATETRUNC`, `DATEDIFF`)
- Reporting View Creation
- Percentage & Contribution Calculations

---

## 🧠 Why This Project Matters

This project replicates real-world retail analytics scenarios where businesses must:

- Track revenue growth
- Detect product performance trends
- Identify high-value customers
- Understand revenue concentration
- Build reporting layers for dashboards

The queries are structured to reflect how data analysts work within data warehouse environments.

---

## 🚀 Author

**Lutfullox Axmedov**  
IT Student | Data Analytics Enthusiast  
SQL • Python • Data Analytics
