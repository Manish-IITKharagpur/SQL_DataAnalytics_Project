-- 7.1 Year-over-year revenue & orders (with YoY growth %)
  WITH yearly AS (
      SELECT
          YEAR(order_date)                AS year,
          SUM(sales_amount)               AS total_revenue,
          COUNT(DISTINCT order_number)    AS total_orders
      FROM gold.facts_sales
      WHERE order_date IS NOT NULL
      GROUP BY YEAR(order_date)
  )
  SELECT
      year,
      total_revenue,
      total_orders,
      LAG(total_revenue) OVER (ORDER BY year)  AS prev_year_revenue,
      ROUND((total_revenue - LAG(total_revenue) OVER (ORDER BY year))
          * 100.0 / NULLIF(LAG(total_revenue) OVER (ORDER BY year), 0), 1) AS revenue_yoy_pct,
      ROUND((total_orders - LAG(total_orders) OVER (ORDER BY year))
          * 100.0/ NULLIF(LAG(total_orders) OVER (ORDER BY year), 0), 1)  AS orders_yoy_pct
  FROM yearly
  ORDER BY year;

 

  -- 7.2 Monthly revenue trend (full years 2011–2013)
   SELECT
      DATETRUNC(MONTH, order_date)             AS month,
      SUM(sales_amount)                           AS total_revenue,
      COUNT(DISTINCT order_number)                AS total_orders,
      LAG(SUM(sales_amount)) OVER (ORDER BY DATETRUNC(MONTH, order_date)) AS prev_month_revenue,
      ROUND((SUM(sales_amount) - LAG(SUM(sales_amount)) OVER (ORDER BY DATETRUNC(MONTH, order_date)))
          * 100.0 / NULLIF(LAG(SUM(sales_amount)) OVER (ORDER BY DATETRUNC(MONTH, order_date)), 0), 1) AS mom_pct
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL
    AND YEAR(order_date) BETWEEN 2011 AND 2013
  GROUP BY DATETRUNC(MONTH , order_date)
  ORDER BY month;


  -- 7.3 YoY revenue by category
  SELECT
      YEAR(f.order_date)              AS year,
      p.category,
      SUM(f.sales_amount)             AS total_revenue,
      LAG(SUM(f.sales_amount)) OVER( PARTITION BY p.category ORDER BY year(f.order_date)) AS prev_year_revenue,
      SUM(f.sales_amount) - LAG(SUM(f.sales_amount)) OVER( PARTITION BY p.category ORDER BY year(f.order_date)) yoy_revenue
  FROM gold.facts_sales f
  LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
  WHERE f.order_date IS NOT NULL
    AND p.category IS NOT NULL
    AND YEAR(order_date) BETWEEN 2011 AND 2013
  GROUP BY p.category,YEAR(f.order_date)
  ORDER BY p.category, year;

  -- 7.4 YoY revenue by country
  SELECT
      YEAR(f.order_date)              AS year,
      c.country,
      SUM(f.sales_amount)              AS total_revenue,
      LAG(SUM(f.sales_amount)) OVER(PARTITION BY c.country  ORDER BY YEAR(f.order_date))  AS prev_year_revenue,
      SUM(f.sales_amount) -  LAG(SUM(f.sales_amount)) OVER(PARTITION BY c.country  ORDER BY YEAR(f.order_date))
  FROM gold.facts_sales f
  JOIN gold.dim_customers c ON f.customer_key = c.customer_key
  WHERE f.order_date IS NOT NULL
    AND c.country != 'n/a'
  GROUP BY c.country,YEAR(f.order_date)

  