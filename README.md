# Pizza Sales Analysis Dashboard  
**MySQL | Power BI | Data Modeling | SQL Analytics**

## Project Summary

This project demonstrates an end-to-end **business intelligence and data analytics workflow** using **MySQL** and **Power BI**.  
The objective was to transform raw pizza sales data into a **clean, normalized relational database**, validate business metrics using SQL, and deliver **interactive Power BI dashboards** to support data-driven decision-making.

The project reflects real-world practices in **data preprocessing, normalization (3NF), SQL-based analysis, data modeling, and dashboard development**.

---

## Business Objectives

- Analyze sales performance across pizzas, categories, and sizes  
- Identify best- and worst-performing products  
- Track daily and monthly order trends  
- Validate Power BI metrics using SQL queries  
- Present insights through executive-ready dashboards  

---

## Tools & Technologies

- **Database:** MySQL  
- **Visualization:** Power BI  
- **Query Language:** SQL  
- **Modeling:** Relational schema (3NF)  
- **Documentation:** SQL process documented separately  
- **Design Assets:** Custom icons and images  

---

## Data Preparation & Modeling

### Data Analysis & Cleaning
- Reviewed raw transactional sales data
- Cleaned inconsistencies and standardized formats
- Identified key entities and relationships

### Data Normalization
- Designed a relational schema normalized to **Third Normal Form (3NF)**
- Reduced redundancy and ensured data integrity
- Improved query efficiency and scalability

Key tables include:
- `orders`
- `order_details`
- `pizzas`
- `pizza_types`

---

## SQL Analytics & Validation

SQL queries were written to compute and validate key business metrics, including:

- Total Revenue  
- Total Orders  
- Total Pizzas Sold  
- Average Order Value  
- Average Pizzas per Order  
- Sales by Category and Size  
- Daily and Monthly Order Trends  
- Best and Worst Selling Products  

All SQL commands and transformations were **fully documented** and used to cross-check Power BI results for accuracy.

---

## Power BI Integration & Modeling

- Connected MySQL database directly to Power BI
- Imported normalized tables
- Defined table relationships
- Performed light data transformations
- Created calculated columns and DAX measures

---

## Dashboard Development

Two interactive dashboards were developed using Power BI:

### 1. Home Dashboard
- KPI cards for key metrics
- Daily and monthly order trends
- Sales distribution by category and size
- Interactive slicers for date range and pizza category
- Executive-level summary view
<img width="1349" height="734" alt="home_dashboard" src="https://github.com/user-attachments/assets/5ad91bd8-2a38-4698-bb6d-9f1887e76290" />


### 2. Best & Worst Sellers Dashboard
- KPI cards for key metrics
- Top 5 pizzas by:
  - Revenue
  - Quantity Sold
  - Total Orders
- Bottom 5 pizzas by:
  - Revenue
  - Quantity Sold
  - Total Orders
- Clear product-level performance comparison

Custom visuals, icons, slicers, and layout design were used to ensure clarity and usability.
<img width="1351" height="736" alt="productPerformance_dashboard" src="https://github.com/user-attachments/assets/6261e057-0edf-411b-9513-402d99510208" />

---

## Key Insights

- Classic pizzas generate the highest revenue and order volume
- Large-size pizzas contribute the most to total sales
- Order volume peaks during weekends and evening hours
- Sales increase significantly during July and January
- Certain products consistently underperform across multiple metrics

---

## Validation Approach

- All KPIs were calculated independently using SQL
- Equivalent measures were recreated in Power BI using DAX
- Results were cross-validated to ensure consistency and accuracy

---

## How to Run the Project

- Execute SQL scripts in MySQL to create and populate normalized tables
- Connect MySQL to Power BI
- Load the Power BI .pbix file
- Use slicers to explore insights interactively

---

## Future Enhancements

- Automate ETL using Python
- Add predictive sales forecasting
- Publish dashboards to Power BI Service
- Expand analysis with customer segmentation
