# Amazon Ad-hoc Sales Analysis using SQL

An end-to-end exploration of Amazon sales transactions across three branches to uncover patterns in product performance, customer behavior, and revenue dynamics.

---

## Table of Contents

1. [Introduction](#introduction)  
2. [Data Source](#data-source)  
3. [Database Setup](#database-setup)  
4. [Data Wrangling & Feature Engineering](#data-wrangling--feature-engineering)  
5. [Business Questions](#business-questions)  
6. [Analysis](#analysis)  
7. [Insights & Summary](#insights--summary)  
8. [Repository Structure](#repository-structure)  
9. [How to Run](#how-to-run)  
10. [Author](#author)  

---

## Introduction

This project analyzes  sales transactions from three Amazon branches—Mandalay, Yangon, and Naypyitaw—to identify the factors driving revenue, product performance, and customer engagement. The goal is to demonstrate ad-hoc sales analysis using pure SQL, from database creation to feature engineering and business-driven queries.

---

## Data Source

The raw dataset contains 20 columns, including transactional details such as:

- invoice_id  
- branch and city  
- customer_type and gender  
- product_line, unit_price, quantity  
- VAT, total, cogs, gross_margin_percentage, gross_income  
- date, time, payment_method, rating  

Find the CSV under the `Dataset/` folder.

---

## Database Setup

1. Create and select the database  
   ```sql
   CREATE DATABASE amazon;
   USE amazon;
   ```

2. Define the `amazondata` table schema  
   ```sql
   CREATE TABLE amazondata (
     invoice_id VARCHAR(30) NOT NULL,
     branch VARCHAR(5) NOT NULL,
     city VARCHAR(30) NOT NULL,
     customer_type VARCHAR(30) NOT NULL,
     gender VARCHAR(10) NOT NULL,
     product_line VARCHAR(100) NOT NULL,
     unit_price DECIMAL(10,2) NOT NULL,
     quantity INT NOT NULL,
     VAT FLOAT(6,4) NOT NULL,
     total DECIMAL(10,2) NOT NULL,
     date DATE NOT NULL,
     time TIME NOT NULL,
     payment_method VARCHAR(30) NOT NULL,
     cogs DECIMAL(10,2) NOT NULL,
     gross_margin_percentage FLOAT(11,9) NOT NULL,
     gross_income DECIMAL(10,2) NOT NULL,
     rating FLOAT NOT NULL
   );
   ```

3. Import `amazondata.csv` from `Dataset/` using your SQL client’s import wizard.

---

## Data Wrangling & Feature Engineering

- Enforced `NOT NULL` constraints to eliminate missing values.  
- Corrected CSV formatting for `time` and `rating` columns.  

Added computed columns via `Data_wrangling_and_feature_engineering.sql`:

| Column    | Definition                                                                                 |
|-----------|--------------------------------------------------------------------------------------------|
| timeofday | `'Morning'`, `'Afternoon'`, or `'Evening'` based on `time`.                                 |
| dayname   | Three-letter weekday name extracted with `DAYOFWEEK(date)`.                                 |
| monthname | Three-letter month name extracted with `MONTH(date)`.                                       |

---

## Business Questions

Defined in `Business_questions_to_answer.sql`, covering:

1. Count of distinct cities  
2. Branch-city mapping  
3. Distinct product line count  
4. Most frequent payment method  
5. Top product line by sales  
6. Monthly revenue trends  
7. Peak COGS month  
8. Top revenue-generating product line  
9. City with highest revenue  
10. Product line with highest VAT  
11. Sales performance classification (“Good”/“Bad”)  
12. Branch exceeding average units sold  
13. Gender-wise product line frequency  
14. Average rating per product line  
15. Sales occurrences by time-of-day and weekday  
16. Top revenue-contributing customer type  
17. City with highest average VAT  
18. Customer type with highest VAT payments  
19. Distinct customer types count  
20. Distinct payment methods count  
21. Most frequent customer type  
22. Customer type purchase frequency  
23. Predominant gender  
24. Gender distribution per branch  
25. Peak rating time of day  
26. Peak rating times by branch  
27. Highest-average-rating day of week  
28. Branch-wise day-of-week ratings  

---

## Analysis

Detailed in `Analysis_list.sql`, including:

- **Product Analysis:** Ranking product lines by total sales to spot top and bottom performers.  
- **Sales Analysis:** Tracking monthly revenue, branch performance, and payment-method breakdown.  
- **Customer Analysis:** Comparing spending by customer type and branch-level rating averages.

---

## Insights & Summary

- **Product Focus:** Food and Beverages leads revenue; Health and Beauty needs targeted boosts.  
- **Seasonality:** January peaks, February dips—plan marketing accordingly.  
- **Branch Performance:** Branch C tops both sales and customer satisfaction.  
- **Payment Trends:** Cash is preferred, with e-wallets rapidly rising.

---

## Repository Structure

```
.
├── Dataset/
│   └── amazondata.csv
├── Presentation/
│   └── SQL_Capstone_Project.pdf
├── SQL Files/
│   ├── Data_wrangling_and_feature_engineering.sql
│   ├── Business_questions_to_answer.sql
│   └── Analysis_list.sql
└── README.md
```

---

## How to Run

1. Clone this repository.  
2. Ensure `amazondata.csv` is in the `Dataset/` folder.  
3. In your SQL environment, connect to the server and run:
   1. `SQL Files/Data_wrangling_and_feature_engineering.sql`  
   2. `SQL Files/Business_questions_to_answer.sql`  
   3. `SQL Files/Analysis_list.sql`  
4. View results in your SQL client or export to CSV for visualization.  
5. Refer to the PDF under `Presentation/` for slide-deck summary.

---

## Author

**Nikhil Karaka**  

Thank you for exploring this project!
