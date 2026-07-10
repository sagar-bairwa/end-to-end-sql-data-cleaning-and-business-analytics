# ⚙ Project Workflow

The project follows a structured SQL workflow that mirrors the data preparation process commonly used by Data Analysts before building reports or dashboards.

The complete workflow is divided into **ten logical stages**, beginning with understanding the raw data and ending with business insight generation.

---

# 📊 Stage 1 — Data Profiling

The first stage focuses on understanding the structure and characteristics of the datasets before performing any transformations.

### Objectives

- Understand dataset structure
- Count records in each table
- Review available columns
- Explore categorical distributions
- Identify missing values
- Perform initial data exploration

### Activities Performed

- Row count analysis
- Column exploration
- Category distribution
- Customer distribution
- Product distribution
- Basic dataset exploration

### Outcome

A clear understanding of the datasets before beginning the cleaning process.

---

# 🔍 Stage 2 — Data Quality Assessment

Once the datasets are understood, a detailed quality assessment is performed to identify issues that may affect reporting and business analysis.

### Data Quality Checks

- Duplicate Orders
- Invalid Customer IDs
- Invalid Product IDs
- Invalid Order IDs
- Missing Customer Records
- Missing Product Records
- Invalid Relationships
- Orphan Records
- Null Value Analysis

### Outcome

A comprehensive report identifying all quality issues requiring correction.

---

# 🧹 Stage 3 — Customer Data Cleaning

The customer dataset is cleaned to improve consistency and ensure accurate customer analysis.

### Cleaning Operations

- Removed duplicate records
- Standardized customer information
- Validated customer IDs
- Corrected formatting inconsistencies
- Removed invalid records

### Outcome

A clean and reliable customer dataset ready for analysis.

---

# 📦 Stage 4 — Product Data Cleaning

Product information is cleaned to improve consistency across product-related analysis.

### Cleaning Operations

- Standardized product information
- Corrected inconsistent categories
- Removed invalid product records
- Validated product identifiers

### Outcome

A structured and consistent product dataset.

---

# 🛒 Stage 5 — Order Data Cleaning

Order records are validated and cleaned to ensure accurate sales reporting.

### Cleaning Operations

- Removed invalid orders
- Removed orphan transactions
- Corrected invalid references
- Validated order relationships
- Eliminated duplicate transactions

### Outcome

Reliable transactional data for business reporting.

---

# ✅ Stage 6 — Data Validation

After cleaning, multiple validation queries are executed to verify the integrity of the transformed datasets.

### Validation Checks

- Record count validation
- Duplicate validation
- Referential integrity validation
- Customer validation
- Product validation
- Order validation
- Relationship validation

### Outcome

Verified datasets with improved consistency and reliability.

---

# 📈 Stage 7 — Dashboard KPIs

Once the datasets have been cleaned and validated, SQL is used to generate business-ready Key Performance Indicators.

### KPIs Generated

- Total Revenue
- Average Revenue per Customer
- Total Customers
- Total Products
- Total Orders

These KPIs provide a high-level overview of business performance and can be directly used in reporting dashboards.

---

# 👥 Stage 8 — Customer Insights

Customer-focused SQL analysis is performed to better understand purchasing behavior.

### Insights Generated

- Customer Distribution
- Top Customers
- Repeat Customers
- High Value Customers
- Customer Spending Analysis
- Average Revenue per Customer

---

# 📦 Stage 9 — Product Insights

Product-level analysis is performed to identify high-performing and low-performing products.

### Insights Generated

- Top Selling Products
- Product Performance
- Revenue by Product
- Category Performance
- Best Performing Categories

---

# 💰 Stage 10 — Sales Insights

The final stage focuses on sales trends and business performance.

### Insights Generated

- Monthly Revenue Trend
- Sales Performance
- Revenue Distribution
- Order Analysis
- Revenue Contribution
- Business Growth Indicators

---

# 🧠 SQL Concepts Applied

This project demonstrates practical usage of SQL concepts commonly used by Data Analysts.

## Querying

- SELECT
- DISTINCT
- WHERE
- ORDER BY
- TOP

---

## Aggregation

- GROUP BY
- HAVING
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

---

## Joins

- INNER JOIN
- LEFT JOIN

---

## Conditional Logic

- CASE
- ISNULL()
- COALESCE()

---

## Data Cleaning

- UPDATE
- DELETE
- TRIM()
- REPLACE()
- CAST()
- CONVERT()

---

## Advanced SQL

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()

---

# 💻 Technology Overview

| Category | Technology |
|------------|------------|
| Database | Microsoft SQL Server |
| Query Language | SQL |
| Version Control | Git |
| Repository | GitHub |

---

# 📁 Repository Structure

```text
end-to-end-sql-data-cleaning-and-business-analytics
│
├── datasets
│   ├── project2_customers.csv
│   ├── project2_products.csv
│   └── project2_orders.csv
│
├── data_cleaning_&_transformation
│   ├── 01_data_profiling.sql
│   ├── 02_Data_Quality_Report.sql
│   ├── 03_Customer_Cleaning.sql
│   ├── 04_Product_Cleaning.sql
│   ├── 05_Order_Cleaning.sql
│   └── 06_Validation.sql
│
├── Business_insights
│   ├── 01_dashboard_KPIs.sql
│   ├── 02_customers_insights.sql
│   ├── 03_product_insights.sql
│   └── 04_sales_insights.sql
│
├── screenshots
│   ├── sql_data_cleaning_workflow.png
│   ├── invalid_entries.png
│   ├── clean_invalid_data.png
│   └── KPIs.png
│
├── business_requirements.md
│
└── README.md
```

---

# 📷 Project Screenshots

## SQL Data Preparation Workflow

![Workflow](screenshots/sql_data_cleaning_workflow.png)

---

## Data Quality Assessment

![Invalid Entries](screenshots/invalid_entries.png)

---

## Data Cleaning Validation

![Data Cleaning](screenshots/clean_invalid_data.png)

---

## Dashboard KPIs

![KPIs](screenshots/KPIs.png)

---

# 🏆 Project Highlights

- End-to-End SQL Data Cleaning Pipeline
- Industry-Style SQL Workflow
- Data Profiling
- Data Quality Assessment
- Customer Data Cleaning
- Product Data Cleaning
- Order Data Cleaning
- Data Validation
- Dashboard KPI Generation
- Customer Analytics
- Product Analytics
- Sales Analytics
- Modular SQL Architecture
- Business Insight Generation
- Clean Repository Structure
- Production-Oriented SQL Development

---

# 💡 SQL Skills Demonstrated

### Data Preparation

- Data Profiling
- Data Cleaning
- Data Validation
- Data Transformation

### SQL Development

- Query Writing
- Aggregations
- Joins
- Window Functions
- CTEs

### Business Analytics

- KPI Reporting
- Customer Analytics
- Product Analytics
- Sales Analytics
- Business Intelligence

---

# 🚀 Future Improvements

Possible enhancements for future versions of this project include:

- Stored Procedures for automation
- SQL Views for reporting
- Index optimization
- Performance tuning
- Integration with Power BI
- Interactive dashboard creation
- Data quality scorecards
- Automated data validation pipeline

---

# 👨‍💻 Author

**Sagar Bairwa**

Aspiring **Data Analyst** passionate about transforming raw data into actionable business insights through SQL, Python, Power BI, and modern data analytics tools.

If you found this project helpful, consider giving it a ⭐ on GitHub.
