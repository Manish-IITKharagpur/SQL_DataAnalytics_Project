
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
    - To analyze the distribution of values in key dimension columns.
===============================================================================
*/

 -- ════════════════════════════════════════════════════════════
  -- SECTION 2: DIMENSIONS EXPLORATION
  -- ════════════════════════════════════════════════════════════

  -- 2.1 Distinct value counts for every dimension column
  SELECT 'country'        AS dimension, COUNT(DISTINCT country)        AS distinct_values FROM gold.dim_customers
  UNION ALL
  SELECT 'gender',                      COUNT(DISTINCT gender)                            FROM gold.dim_customers
  UNION ALL
  SELECT 'marital_status',              COUNT(DISTINCT marital_status)                    FROM gold.dim_customers
  UNION ALL
  SELECT 'category',                    COUNT(DISTINCT category)                          FROM gold.dim_products
  UNION ALL
  SELECT 'subcategory',                 COUNT(DISTINCT subcategory)                       FROM gold.dim_products
  UNION ALL
  SELECT 'product_line',                COUNT(DISTINCT product_line)                      FROM gold.dim_products
  UNION ALL
  SELECT 'maintenance',                 COUNT(DISTINCT maintenance)                       FROM gold.dim_products
  ORDER BY dimension;

  
  -- 2.2 All distinct countries (incl. 'n/a')
  SELECT country, COUNT(*) AS customer_count
  FROM gold.dim_customers
  GROUP BY country
  ORDER BY customer_count DESC;

  -- 2.3 All distinct genders
  SELECT gender, COUNT(*) AS customer_count
  FROM gold.dim_customers
  GROUP BY gender
  ORDER BY customer_count DESC;

  -- 2.4 All distinct marital statuses
  SELECT marital_status, COUNT(*) AS customer_count
  FROM gold.dim_customers
  GROUP BY marital_status;

  -- 2.5 All distinct product categories
  SELECT category, COUNT(*) AS product_count
  FROM gold.dim_products
  GROUP BY category
  ORDER BY product_count DESC;

  -- 2.6 All distinct subcategories by category
  SELECT category, subcategory, COUNT(*) AS product_count
  FROM gold.dim_products
  WHERE subcategory IS NOT NULL
  GROUP BY category, subcategory
  ORDER BY category, product_count DESC;

  -- 2.7 All distinct product lines
  SELECT product_line, COUNT(*) AS product_count
  FROM gold.dim_products
  GROUP BY product_line
  ORDER BY product_count DESC;

  -- 2.8 Maintenance flag distribution
  SELECT maintenance, COUNT(*) AS product_count
  FROM gold.dim_products
  GROUP BY maintenance;
