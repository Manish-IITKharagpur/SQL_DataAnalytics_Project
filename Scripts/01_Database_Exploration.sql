/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

  -- ============================================================
  -- FULL EDA — SQL Analytics Gold Layer
  -- Schema: gold | Tables: fact_sales, dim_customers, dim_products
  -- Sections: 1-Database Exploration → 12-Reporting
  -- ============================================================


  -- ════════════════════════════════════════════════════════════
  -- SECTION 1: DATABASE EXPLORATION
  -- ════════════════════════════════════════════════════════════

  -- 1.1 All schemas in the database
  SELECT schema_name
  FROM information_schema.schemata
  ORDER BY schema_name;

  -- 1.2 All tables in gold schema
  SELECT table_schema, table_name, table_type
  FROM information_schema.tables
  WHERE table_schema = 'gold'
  ORDER BY table_name;

  -- 1.3 All columns across all tables (names, types, nullability)
  SELECT
      table_name,
      column_name,
      ordinal_position,
      data_type,
      is_nullable
  FROM information_schema.columns
  WHERE table_schema = 'gold'
  ORDER BY table_name, ordinal_position;

  -- 1.4 Column-level detail per table
  DESCRIBE gold.fact_sales;
  DESCRIBE gold.dim_customers;
  DESCRIBE gold.dim_products;

  -- 1.5 First 5 rows of each table
  SELECT * FROM gold.fact_sales    LIMIT 5;
  SELECT * FROM gold.dim_customers LIMIT 5;
  SELECT * FROM gold.dim_products  LIMIT 5;
