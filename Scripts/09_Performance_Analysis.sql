
/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/
-- 9.1 Gross margin by product (sales - cost) / sales
  SELECT
    TOP 10
      p.product_name,
      p.category,
      SUM(f.sales_amount)                                         AS total_revenue,
      SUM(f.quantity * p.cost)                                    AS total_cost,
      SUM(f.sales_amount) - SUM(f.quantity * p.cost)              AS gross_profit,
      ROUND((SUM(f.sales_amount) - SUM(f.quantity * p.cost))
          * 100 / NULLIF(SUM(f.sales_amount), 0), 1)           AS gross_margin_pct
  FROM gold.facts_sales f
  JOIN gold.dim_products p ON f.product_key = p.product_key
  WHERE p.cost > 0
  GROUP BY p.product_name, p.category
  ORDER BY gross_profit DESC
  
  -- 9.2 Gross margin by category
  SELECT
      p.category,
      SUM(f.sales_amount)                                         AS total_revenue,
      SUM(f.quantity * p.cost)                                    AS total_cost,
      SUM(f.sales_amount) - SUM(f.quantity * p.cost)              AS gross_profit,
      ROUND((SUM(f.sales_amount) - SUM(f.quantity * p.cost))
          * 100/NULLIF(SUM(f.sales_amount), 0), 1)           AS gross_margin_pct
  FROM gold.facts_sales f
  JOIN gold.dim_products p ON f.product_key = p.product_key
  WHERE p.cost > 0
    AND p.category IS NOT NULL
  GROUP BY p.category
  ORDER BY gross_margin_pct DESC;

   -- 9.3 AOV vs revenue per customer by country
  SELECT
      c.country,
      ROUND(SUM(f.sales_amount) * 1.0
          / NULLIF(COUNT(DISTINCT f.order_number), 0), 2)         AS avg_order_value,
      ROUND(SUM(f.sales_amount) * 1.0
          / NULLIF(COUNT(DISTINCT f.customer_key), 0), 2)         AS revenue_per_customer,
      ROUND(COUNT(DISTINCT f.order_number) * 1.0
          / NULLIF(COUNT(DISTINCT f.customer_key), 0), 2)         AS orders_per_customer
  FROM gold.facts_sales f
  JOIN gold.dim_customers c ON f.customer_key = c.customer_key
  WHERE c.country != 'n/a'
  GROUP BY c.country
  ORDER BY revenue_per_customer DESC;

    -- 9.4 Year-over-year AOV performance
  SELECT
      YEAR(order_date)    AS year,
      ROUND(SUM(sales_amount) * 1.0
          / NULLIF(COUNT(DISTINCT order_number), 0), 2)    AS avg_order_value,
      ROUND(SUM(quantity) * 1.0
          / NULLIF(COUNT(DISTINCT order_number), 0), 2)    AS avg_units_per_order
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL
  GROUP BY YEAR(order_date)
  ORDER BY year;



/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */

WITH yearly_product_sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold.facts_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY 
        YEAR(f.order_date),
        p.product_name
)
SELECT
    order_year,
    product_name,
    current_sales,
    AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    -- Year-over-Year Analysis
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
FROM yearly_product_sales
ORDER BY product_name, order_year;