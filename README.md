# Logistics Network Optimization Analysis 🚚

## 📌 Project Overview
This project performs a comprehensive analysis of Amazon's logistics network to identify bottlenecks in delivery routes, warehouse processing times, and agent performance. The goal was to reduce delivery delays and optimize operational efficiency using SQL.

## 🔍 Key Problems Identified
* **High Failure Rates:** Identified **Route R020** as a critical failure point with a **70% delay rate**.
* **Warehouse Bottlenecks:** **Warehouse W010** was flagged for operational inefficiency with an average processing time of **171 minutes**, significantly higher than the global average of **110 minutes**.
* **Delay Root Causes:** "Sorting Delay" was the leading cause of missed deadlines (272 instances), surpassing external factors like "Weather" (263 instances).

## 💡 Strategic Recommendations
1.  **Rerouting Strategy:** Recommended immediate route re-planning for **Route R016** due to critical speed inefficiencies (<0.2 km/min) caused by congestion.
2.  **Agent Efficiency:** Analysis revealed that top-performing agents maintained higher average speeds (**60 km/h**) compared to underperformers (**56.8 km/h**), proving that efficiency drives reliability.
3.  **Operational Audit:** Proposed an immediate audit of Warehouse W010 to address staffing or equipment shortages causing dispatch delays.

## 🛠️ Technical Approach
* **SQL Skills:** Used Joins, Window Functions (Dense Rank), and Aggregations to calculate KPIs.
* **Data Cleaning:** Standardized date formats and handled null values for traffic delay metrics.

## 📂 Files Included
* `Logistics_Analysis_Queries.sql`: Complete SQL script containing data cleaning and analytical queries.
* `Logistics_Optimization_Presentation.pdf`: Executive summary of findings and recommendations.
