-- 6.1 Top 10 products by revenue
  SELECT TOP 10
      RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank,
      p.product_name,
      p.category,
      p.subcategory,
      SUM(f.sales_amount)             AS total_revenue,
      SUM(f.quantity)                 AS total_units
  FROM gold.facts_sales f
  JOIN gold.dim_products p ON f.product_key = p.product_key
  GROUP BY p.product_name, p.category, p.subcategory
  ORDER BY total_revenue DESC
 

  -- 6.2 Bottom 10 products by revenue (among products that have sales)
  SELECT TOP 10
      RANK() OVER (ORDER BY SUM(f.sales_amount) ASC) AS rank,
      p.product_name,
      p.category,
      SUM(f.sales_amount)             AS total_revenue,
      SUM(f.quantity)                 AS total_units
  FROM gold.facts_sales f
  JOIN gold.dim_products p ON f.product_key = p.product_key
  GROUP BY p.product_name, p.category
  ORDER BY total_revenue ASC;

  -- 6.3 Top 10 customers by revenue
  SELECT TOP 10
      RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank,
      c.customer_key,
      c.first_name || ' ' || c.last_name              AS customer_name,
      c.country,
      SUM(f.sales_amount)             AS total_revenue,
      COUNT(DISTINCT f.order_number)  AS total_orders
  FROM gold.facts_sales f
  JOIN gold.dim_customers c ON f.customer_key = c.customer_key
  GROUP BY c.customer_key, c.first_name, c.last_name, c.country
  ORDER BY total_revenue DESC
  

  -- 6.4 Top 5 countries by revenue
  SELECT TOP 5
      RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank,
      c.country,
      SUM(f.sales_amount)             AS total_revenue,
      COUNT(DISTINCT f.customer_key)  AS total_customers
  FROM gold.facts_sales f
  JOIN gold.dim_customers c ON f.customer_key = c.customer_key
  WHERE c.country != 'n/a'
  GROUP BY c.country
  ORDER BY total_revenue DESC;

  -- 6.5 Top 5 subcategories by revenue
  SELECT TOP 5
      RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank,
      p.category,
      p.subcategory,
      SUM(f.sales_amount)             AS total_revenue,
      SUM(f.quantity)                 AS total_units
  FROM gold.facts_sales f
  JOIN gold.dim_products p ON f.product_key = p.product_key
  WHERE p.subcategory IS NOT NULL
  GROUP BY p.category, p.subcategory
  ORDER BY total_revenue DESC;