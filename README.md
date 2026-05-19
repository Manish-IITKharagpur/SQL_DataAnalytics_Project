# 📊 SQL Exploratory Data Analysis (EDA) & Business Insights
**Phase 2: Analytics Layer** — Built on top of the [SQL Data Warehouse Project](https://github.com/Manish-IITKharagpur/SQL_Data_WareHouse_Project)

[![Project Status](https://img.shields.io/badge/Status-Active-success)]() 
[![SQL](https://img.shields.io/badge/SQL-100%25-blue)]()
[![License](https://img.shields.io/badge/License-MIT-green)]()

---

## 🎯 Project Overview

After successfully building a **Medallion Data Warehouse** (Bronze → Silver → Gold), this repository focuses on the **"Value Creation" phase**. Using the **Gold Layer (Star Schema)**, I perform comprehensive Exploratory Data Analysis (EDA) to answer critical business questions, identify trends, and provide actionable insights for stakeholders.

This is a collection of **production-ready SQL scripts** for data exploration, analytics, and reporting—designed to help data analysts and BI professionals quickly explore, segment, and analyze data within a relational database.

### 🔗 Related Project
This repository is the **analytics extension** of my data warehouse foundation:
**[SQL_Data_WareHouse_Project](https://github.com/Manish-IITKharagpur/SQL_Data_WareHouse_Project)** — Medallion Architecture implementation (Bronze → Silver → Gold)

---

## 🏗️ Architecture Context

This project operates on the **Gold Layer** of the data warehouse:

```
Sources (CRM/ERP) → Bronze Layer (Raw Data) → Silver Layer (Cleaned Data) → Gold Layer (Star Schema) → **EDA & Analytics**
                                                                                                           ↑
                                                                                                   You are here
```

**Gold Layer Structure:**
- **Star Schema** with dimensions and facts
- Business-ready data optimized for analytics
- Views designed for fast querying and visualization

---

## 📁 Repository Structure

```
SQL_DataAnalytics_Project/
├── Scripts/                    # SQL EDA queries organized by analysis type
│   ├── 01_Database_Exploration.sql
│   ├── 02_Dimension_Exploration.sql
│   ├── 03_Date_Range_Exploration.sql
│   ├── 04_Measure_Exploration.sql
│   ├── 05_magnitude_analysis.sql
│   ├── 06_Ranking.sql
│   ├── 07_Change_Over_Time.sql
│   ├── 08_Cumulative_Analysis.sql
│   ├── 09_Performance_Analysis.sql
│   ├── 10_Part_to_Whole.sql
│   └── 11_Date_Segmentation.sql
│
├── Visualization/              # Charts and dashboards generated from analysis
│   └── [Tableau/Power BI visualizations]
│
├── Charts_Explanation/         # Documentation explaining each visualization
│   └── [Detailed explanations of insights]
│
└── README.md                   # This file
```

---

## 🔍 EDA Analysis Categories

### 1. Database & Dimension Exploration
**Scripts:** `01_Database_Exploration.sql`, `02_Dimension_Exploration.sql`

Understand the structure, relationships, and data quality of the Gold layer:
- Schema inspection and metadata analysis
- Dimension cardinality and hierarchy verification
- Data completeness and NULL value assessment
- Foreign key relationship validation

**Key Insights:**
- Total records, date ranges, and data freshness
- Dimension coverage (customers, products, locations, time)
- Data quality metrics (completeness, accuracy)

---

### 2. Date Range & Temporal Analysis
**Scripts:** `03_Date_Range_Exploration.sql`, `07_Change_Over_Time.sql`, `11_Date_Segmentation.sql`

Analyze temporal patterns and trends:
- **Date Range Exploration:** Available data periods, gaps in time series
- **Change Over Time:** Year-over-year (YoY), month-over-month (MoM) growth rates
- **Date Segmentation:** Weekday vs weekend, seasonal patterns, fiscal period analysis

**Key Insights:**
- Revenue trends over time (daily, weekly, monthly, yearly)
- Seasonality detection (peak vs low periods)
- Growth rates and momentum indicators

---

### 3. Measures & Metrics Exploration
**Scripts:** `04_Measure_Exploration.sql`, `05_magnitude_analysis.sql`

Examine key business measures and their distributions:
- **Measure Exploration:** Statistical summaries (mean, median, std dev, percentiles)
- **Magnitude Analysis:** Order of magnitude grouping, distribution analysis

**Key Insights:**
- Average order value, basket size, revenue per customer
- Sales concentration (80/20 rule analysis)
- Outlier detection and anomaly identification

---

### 4. Ranking & Performance Analysis
**Scripts:** `06_Ranking.sql`, `09_Performance_Analysis.sql`

Identify top performers and performance benchmarks:
- **Ranking:** Top N products, customers, regions by revenue/volume
- **Performance Analysis:** Cohort performance, goal attainment tracking

**Key Insights:**
- Best-selling products and high-value customers
- Regional performance comparison
- Product line profitability ranking

---

### 5. Cumulative & Part-to-Whole Analysis
**Scripts:** `08_Cumulative_Analysis.sql`, `10_Part_to_Whole.sql`

Understand cumulative patterns and contribution analysis:
- **Cumulative Analysis:** Running totals, cumulative revenue, moving averages
- **Part-to-Whole:** Category contribution, market share, revenue mix

**Key Insights:**
- Pareto analysis (what drives 80% of revenue?)
- Category mix evolution over time
- Customer/product contribution to total revenue

---

## 📊 Sample Visualizations

<details>
<summary><b>Click to view sample insights</b></summary>

### Revenue by Product Category
- **Top Category:** Bikes (65% of total revenue)
- **Growth Leader:** Accessories (+45% YoY)
- **Underperformer:** Components (flat growth)

### Customer Segmentation
- **High-Value Customers:** Top 10% contribute 40% of revenue
- **Geographic Distribution:** North America (55%), Europe (30%), Asia-Pacific (15%)

### Temporal Patterns
- **Peak Months:** June, November, December
- **Growth Rate:** 12% YoY average
- **Seasonal Variance:** 25% difference between peak and low months

</details>

> **Note:** Full visualizations and detailed explanations are available in the `Visualization/` and `Charts_Explanation/` folders.

---

## 🚀 How to Use This Repository

### Prerequisites
- Access to the Gold Layer from the [SQL Data Warehouse Project](https://github.com/Manish-IITKharagpur/SQL_Data_WareHouse_Project)
- SQL Server Management Studio (SSMS) or Azure Data Studio
- Basic understanding of star schema and dimensional modeling

### Running the Scripts

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Manish-IITKharagpur/SQL_DataAnalytics_Project.git
   cd SQL_DataAnalytics_Project
   ```

2. **Connect to your Gold Layer database:**
   - Open SSMS or Azure Data Studio
   - Connect to the database containing the Gold layer

3. **Run scripts in order:**
   ```sql
   -- Start with exploration
   :r Scripts/01_Database_Exploration.sql
   :r Scripts/02_Dimension_Exploration.sql
   
   -- Then run analysis queries
   :r Scripts/04_Measure_Exploration.sql
   :r Scripts/06_Ranking.sql
   ```

4. **Customize for your data:**
   - Update date ranges in queries
   - Modify TOP N rankings
   - Adjust thresholds for your business context

---

## 📈 Key Business Questions Answered

| Business Question | Analysis Type | Script(s) |
|-------------------|---------------|-----------|
| What is our total revenue by category? | Part-to-Whole | 10_Part_to_Whole.sql |
| Which products are our top sellers? | Ranking | 06_Ranking.sql |
| How has revenue changed over time? | Time Series | 07_Change_Over_Time.sql |
| What is the average order value? | Measure Exploration | 04_Measure_Exploration.sql |
| Who are our highest-value customers? | Ranking + Performance | 06_Ranking.sql, 09_Performance_Analysis.sql |
| What are our seasonal trends? | Date Segmentation | 11_Date_Segmentation.sql |
| How concentrated is our revenue? | Magnitude + Cumulative | 05_magnitude_analysis.sql, 08_Cumulative_Analysis.sql |

---

## 🎓 SQL Techniques Demonstrated

### Advanced SQL Patterns Used:
- **Window Functions:** `ROW_NUMBER()`, `RANK()`, `LAG()`, `LEAD()`, `SUM() OVER()`
- **CTEs (Common Table Expressions):** Multi-level aggregations and recursive queries
- **Aggregation Functions:** Statistical measures (STDEV, PERCENTILE_CONT, etc.)
- **Date Functions:** Date arithmetic, fiscal calendar calculations
- **Conditional Aggregation:** `CASE WHEN` with `SUM()` for pivot-like analysis
- **Subqueries:** Correlated and non-correlated subqueries for filtering and enrichment

---

## 🔗 Integration with BI Tools

These SQL scripts serve as the **analytical foundation** for:
- **Tableau/Power BI Dashboards:** Pre-aggregated queries for fast dashboard loading
- **Python/R Analysis:** Export results as CSV for statistical modeling
- **Excel Pivot Tables:** Structured queries optimized for Excel consumption
- **Scheduled Reports:** Parameterized queries for automated reporting

---

## 📝 Documentation

Each script includes:
- **Header comment** explaining the business purpose
- **Expected output** description
- **Key findings** template for stakeholder communication
- **Modification notes** for customization

Example:
```sql
/*
===============================================================================
Script: 06_Ranking.sql
Purpose: Identify top 10 products by revenue to focus marketing efforts
Author: Manish
Date: 2024-05-XX
===============================================================================
Expected Output:
    - Product name, category, total revenue, rank
    - Top 10 products only
    
Key Insight:
    - Top 3 products account for 45% of total revenue
    - Bikes dominate top rankings (7 of top 10)
===============================================================================
*/
```

---

## 🛠️ Tech Stack

- **Database:** SQL Server (Gold Layer from Data Warehouse)
- **Query Language:** T-SQL (with advanced analytical functions)
- **Visualization:** Tableau / Power BI (outputs from SQL queries)
- **Version Control:** Git / GitHub

---

## 📊 Project Metrics

- **Total SQL Scripts:** 11
- **Analysis Categories:** 5
- **Business Questions Answered:** 20+
- **Data Coverage:** Full historical data in Gold layer
- **Query Performance:** Optimized for sub-second response on indexed views

---

## 🚀 Future Enhancements

### Phase 3: Advanced Analytics (Planned)
- [ ] **Predictive Models:** Customer churn prediction, sales forecasting
- [ ] **Cohort Analysis:** Customer lifetime value (CLV) analysis
- [ ] **Basket Analysis:** Product affinity and cross-sell opportunities
- [ ] **Python Integration:** Automated EDA reports using pandas + SQL
- [ ] **Airflow DAGs:** Scheduled EDA refresh and stakeholder delivery

---

## 📚 Learning Resources

If you're new to SQL EDA, these scripts demonstrate:
1. **How to structure exploratory queries** for different business questions
2. **Best practices for readability** (CTEs vs subqueries, naming conventions)
3. **Performance optimization** (indexing strategies, query plan analysis)
4. **Stakeholder communication** (translating SQL results into business insights)

---

## 🤝 Contributing

This is a personal portfolio project, but I welcome:
- **Suggestions** for additional analysis types
- **Optimizations** for existing queries
- **Bug reports** if queries produce unexpected results

Feel free to open an issue or submit a pull request!

---

## 📧 Contact

**Manish** — Data Analyst | Aspiring Data Engineer

- 💼 [LinkedIn](https://www.linkedin.com/in/your-profile)
- 🐙 [GitHub](https://github.com/Manish-IITKharagpur)
- 📧 [Email](mailto:your.email@example.com)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Data Source:** AdventureWorks-style bicycle retail dataset
- **Architecture Inspiration:** Medallion Architecture best practices
- **Community:** SQL Server and data analytics communities on GitHub

---

## ⭐ If you found this helpful, please star the repository!

**Related Projects:**
- [SQL Data Warehouse (Foundation)](https://github.com/Manish-IITKharagpur/SQL_Data_WareHouse_Project)
- [More projects coming: Python, Airflow, dbt, ML...]

---

*Last Updated: May 2026*
