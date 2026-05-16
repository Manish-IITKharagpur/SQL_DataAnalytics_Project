/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/
    -- 4.1 Statistical summary — fact_sales numeric columns
      SELECT 
       'sales_amount' AS 'measures',
       COUNT(*) AS row_count,
       COUNT(CASE WHEN sales_amount IS NULL THEN 1 END) AS null_count,
       MIN(sales_amount) AS min_val,
       MAX(sales_amount) AS max_val,
       CAST(AVG(sales_amount) AS FLOAT) AS avg_val,
       ROUND(STDEV(sales_amount * 1.0), 2) AS stddev_val,
       SUM(sales_amount) AS total_sales
       FROM gold.facts_sales
      UNION ALL
      SELECT
          'quantity',
          COUNT(*),
          COUNT(CASE WHEN  quantity IS NULL THEN 1 END),
          MIN(quantity), MAX(quantity),
          ROUND(AVG(quantity * 1.0), 2),
          ROUND(STDEV(quantity * 1.0), 2),
          SUM(quantity)
      FROM gold.facts_sales
      UNION ALL
      SELECT
          'price',
          COUNT(*),
          COUNT( CASE WHEN price IS NULL THEN 1 END),
          MIN(price), MAX(price),
          ROUND(AVG(price * 1.0), 2),
          ROUND(STDEV(price * 1.0), 2),
          SUM(price)
      FROM gold.facts_sales;


 -- 4.2 Statistical summary — dim_products numeric columns
  SELECT
      'cost' AS measure,
      COUNT(*)  AS row_count,
      COUNT(*) FILTER (WHERE cost IS NULL) AS null_count,
      MIN(cost) AS min_val,
      MAX(cost) AS max_val,
      ROUND(AVG(cost * 1.0), 2)    AS avg_val,
      ROUND(STDDEV(cost * 1.0), 2) AS stddev_val,
      SUM(cost) AS total
  FROM gold.dim_products;

  -- 4.3 Price vs cost spread (margin potential per product)
  SELECT TOP 15
      p.product_name,
      p.category,
      p.cost,
      ROUND(AVG(f.price * 1.0), 2)                              AS avg_selling_price,
      ROUND(AVG(f.price * 1.0) - p.cost, 2)                    AS gross_margin_amt,
      ROUND((AVG(f.price * 1.0) - p.cost) * 100.0
          / NULLIF(AVG(f.price * 1.0), 0), 1)                  AS gross_margin_pct
  FROM gold.fact_sales f
  JOIN gold.dim_products p ON f.product_key = p.product_key
  WHERE p.cost > 0
  GROUP BY p.product_name, p.category, p.cost
  ORDER BY gross_margin_pct DESC;


