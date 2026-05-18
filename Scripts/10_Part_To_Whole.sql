  -- ════════════════════════════════════════════════════════════
  -- SECTION 10: PART-TO-WHOLE
  -- ════════════════════════════════════════════════════════════

  -- 10.1 Revenue share by category (% of total)
      SELECT
          p.category,
          SUM(f.sales_amount)                                         AS total_revenue,
          SUM(SUM(f.sales_amount)) OVER() AS sum_total_revenue,
          ROUND(SUM(f.sales_amount) * 100.0
              / SUM(SUM(f.sales_amount)) OVER (), 1)                 AS revenue_pct
      FROM gold.facts_sales f
      JOIN gold.dim_products p ON f.product_key = p.product_key
      WHERE p.category IS NOT NULL
      GROUP BY p.category
      ORDER BY revenue_pct DESC;

  -- 10.2 Revenue share by country
  SELECT
      c.country,
      SUM(f.sales_amount)                                         AS total_revenue,
      ROUND(SUM(f.sales_amount) * 100
          / SUM(SUM(f.sales_amount)) OVER (), 1)                 AS revenue_pct
  FROM gold.facts_sales f
  JOIN gold.dim_customers c ON f.customer_key = c.customer_key
  WHERE c.country != 'n/a'
  GROUP BY c.country
  ORDER BY revenue_pct DESC;

  -- 10.3 Revenue share by product line
  SELECT
      p.product_line,
      SUM(f.sales_amount)                                         AS total_revenue,
     CAST( ROUND(SUM(f.sales_amount) * 100.0
          / SUM(SUM(f.sales_amount)) OVER (), 1) AS DECIMAL(10,2))              AS revenue_pct
  FROM gold.facts_sales f
  JOIN gold.dim_products p ON f.product_key = p.product_key
  WHERE p.product_line != 'n/a'
  GROUP BY p.product_line
  ORDER BY revenue_pct DESC;

  -- 10.4 Revenue share by year (contribution of each year to all-time total)
  SELECT
      YEAR(order_date)    AS year,
      SUM(sales_amount)   AS total_revenue,
      CAST(ROUND(SUM(sales_amount) * 100.0
          / SUM(SUM(sales_amount)) OVER (), 1) AS DECIMAL(10,2)) AS revenue_pct
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL
  GROUP BY YEAR(order_date)
  ORDER BY year;

  -- 10.5 Category × country revenue cross-tab (% within country)
  SELECT
      c.country,
      p.category,
      SUM(f.sales_amount)                                         AS total_revenue,
      ROUND(SUM(f.sales_amount) * 100.0
          / SUM(SUM(f.sales_amount)) OVER (PARTITION BY c.country), 1) AS pct_within_country
  FROM gold.facts_sales f
  JOIN gold.dim_customers c ON f.customer_key = c.customer_key
  JOIN gold.dim_products  p ON f.product_key  = p.product_key
  WHERE c.country != 'n/a'
    AND p.category IS NOT NULL
  GROUP BY c.country, p.category
  ORDER BY c.country, total_revenue DESC;