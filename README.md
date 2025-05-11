# SQL Sales Data Analysis Project

### Author: Siya Gupta  
**BTech in Computer Science | Business Analyst**

---

## Project Overview

This project uses a comprehensive sample sales database with the following tables:

- `customers`  
- `orders`  
- `orderdetails`  
- `payments`  
- `employees`  
- `offices`  
- `products`  
- `productlines`  

The goal is to demonstrate how SQL can be used to analyze business performance, validate data accuracy, and support decision-making. These queries replicate real-world tasks performed by business analysts across multiple client projects.

---

## Tools Used

- MySQL Workbench  
- SQL (Joins, Grouping, Aggregations, Filtering, Date Functions)

---

## Problem Statements and SQL Concepts Used

| No. | Description                                                        | SQL Concepts Used                            |
| --- | ------------------------------------------------------------------ | -------------------------------------------- |
| 1   | Total sales and quantity by product line                           | JOIN, GROUP BY, SUM()                        |
| 2   | Monthly revenue trend analysis                                     | DATE_FORMAT, GROUP BY                        |
| 3   | Identify high-value customers based on total payments             | JOIN, GROUP BY, ORDER BY, LIMIT              |
| 4   | List of products with no sales                                     | LEFT JOIN, IS NULL                           |
| 5   | Revenue vs credit limit analysis per customer                      | JOIN, GROUP BY, SUM(), calculations          |
| 6   | Employee performance by total revenue handled                      | Multi-table JOIN, GROUP BY                   |
| 7   | Validation: Payment vs order amount for each customer              | JOIN, calculations, HAVING                   |
| 8   | Orders shipped late                                                | Date comparison, DATEDIFF()                  |
| 9   | Orders grouped by country                                          | JOIN, GROUP BY                               |
| 10  | Agents with no assigned customers                                  | LEFT JOIN, IS NULL                           |

---

## Key Takeaways

- Built and ran SQL queries for business insights and reporting  
- Analyzed customer payments, product sales, and employee performance  
- Validated business rules using logic and calculations  
- Strengthened understanding of real-world SQL use cases

---

## Files Included

- `advanced_sales_analysis_queries.sql` – All SQL queries written for this project  
- `README.md` – Project documentation  

---

## How to Use

1. Clone or download this repository  
2. Load the sample database into MySQL Workbench  
3. Open the SQL file  
4. Run queries one-by-one to view results and insights  

---

## Contact

**Email:** guptasiya282@gmail.com
**LinkedIn:** https://www.linkedin.com/in/siyagupta/
