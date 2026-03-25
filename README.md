# 📊 Google Ngram Trend Analysis (1940-2019)

## 🎯 Project Overview
This project leverages **Google BigQuery** to analyze massive-scale historical data from the **Google Books Ngram dataset (200GB+)**. By querying millions of digitized volumes, I tracked the linguistic "inflection points" where digital terminology surpassed analog media in global discourse.

## 🛠️ Technical Stack & Skills
* **SQL (BigQuery Standard Dialect):** Advanced querying, including `JOIN`, `CROSS JOIN UNNEST`, and `WINDOW FUNCTIONS`.
* **Data Infrastructure:** Managed multi-terabyte dataset queries within cloud-native environments.
* **Schema Expertise:** Handled complex `RECORD` and `REPEATED` data types (BigQuery Structs and Arrays).

## 🚀 Key Technical Flexes
* **Flattening Nested Data:** Implemented `UNNEST` logic to transform hierarchical book data into a relational time-series format.
* **Advanced Analytics:** Utilized `LAG()` window functions to calculate Year-over-Year (YoY) growth velocity for emerging technologies.
* **Regional Optimization:** Resolved cross-regional table availability constraints to ensure high-performance query execution.

## 💡 Findings
The analysis successfully quantified the "Digital Pivot," identifying the exact years where 'Internet' mentions showed a 400x growth rate compared to legacy media like 'Television'.
