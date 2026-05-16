/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

  -- ════════════════════════════════════════════════════════════
  -- SECTION 3: DATE EXPLORATION
  -- ════════════════════════════════════════════════════════════

  -- 3.1 Overall date boundaries in fact_sales
  SELECT
      MIN(order_date)  AS first_order_date,
      MAX(order_date)  AS last_order_date,
      MAX(ship_date)   AS last_ship_date,
      DATEDIFF(DAY,  MIN(order_date), MAX(order_date)) AS date_span_days
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL;

  -- 3.2 Distinct years present
  SELECT
      YEAR(order_date)             AS order_year,
      COUNT(DISTINCT order_date)   AS distinct_dates,
      COUNT(DISTINCT order_number) AS total_orders,
      MIN(order_date)              AS first_date,
      MAX(order_date)              AS last_date
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL
  GROUP BY YEAR(order_date)
  ORDER BY 1;

  -- 3.3 Distinct months present (are all 12 months covered per year?)
  SELECT
      YEAR(order_date)  AS year,
      MONTH(order_date) AS month,
      COUNT(DISTINCT order_number) AS total_orders
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL
  GROUP BY YEAR(order_date), MONTH(order_date)
  ORDER BY year, month;

  SELECT * FROM gold.facts_sales

  -- 3.4 NULL date counts across all date columns
  SELECT
      COUNT(*)                                   AS total_rows,
      COUNT(CASE WHEN order_date IS NULL THEN 1 END) AS null_order_date,
      COUNT( CASE WHEN ship_date IS NULL THEN 1 END) null_ship_date,
      COUNT( CASE WHEN due_date   IS NULL THEN 1 END)  AS null_due_date
  FROM gold.facts_sales;

  -- 3.5 Earliest and latest order per customer
  SELECT 
      customer_key,
      MIN(order_date)                               AS first_order_date,
      MAX(order_date)                               AS last_order_date,
      DATEDIFF(DAY, MIN(order_date), MAX(order_date)) AS customer_lifespan_days,
      COUNT(DISTINCT order_number)                     AS total_orders
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL
  GROUP BY customer_key
  ORDER BY customer_lifespan_days DESC, total_orders DESC;

  -- 3.6 Customer registration date range
  SELECT
      MIN(create_date) AS first_customer_created,
      MAX(create_date) AS last_customer_created,
      COUNT(*)         AS total_customers
  FROM gold.dim_customers;

  -- 3.7 Shipping lag distribution (order → ship)
  
  SELECT 
     DATEDIFF(DAY, order_date, ship_date)  AS ship_lag_days,
     COUNT(*)                                  AS order_count
  FROM gold.facts_sales
  WHERE order_date IS NOT NULL
    AND ship_date  IS NOT NULL
    AND ship_date >= order_date
  GROUP BY DATEDIFF(DAY,order_date,ship_date)
  ORDER BY ship_lag_days;

