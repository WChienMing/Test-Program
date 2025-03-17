# Test-Program

## Introduction
This repository contains my submission for:
- **A) Programming Test** (Web development using PHP & jQuery)
- **B) SQL Improvement Logic Test** (Optimizing a slow SQL query)

The following files and directories contain my solutions.

## **A) Programming Test**
### 📌 What is inside `A_Programming_Test/`?
This folder contains my solution for the programming test:
- `index.html` → The frontend interface using jQuery.
- `poker.php` → The backend logic for distributing playing cards.
- `docker/` → Optional Docker environment to run program (if needed).

### How to Run?
#### **Method 1: Run Locally**
1. Install **WAMP** or any local PHP server.
2. Place the `A_Programming_Test/` folder inside your server's web directory.
3. Open `http://localhost/A_Programming_Test/index.html` in your browser.

#### **Method 2: Run in Docker**
1. Navigate to the `A_Programming_Test/docker` folder.
2. Run the following command to start the container:
    - docker-compose build
    - docker-compose up -d
3. Open http://localhost:8080 in your browser.


## **B) SQL Improvement Logic Test**
### 📌 What is inside `B_SQL_Improvement/`?
- `before.sql` → Original slow query.
- `database_setup.sql` → This file is created for testing purposes only.
- `explanation.md` → Logical explanation for SQL query improvements.
- `docker/` → Optional Docker environment to run MySQL.

### **Issue**: The original query was slow (~8 seconds) due to:
  - **Full Table Scan** caused by `LIKE '%xxx%'` searches.
  - **Too many `LEFT JOIN`** queries increasing processing time.
  - **Unnecessary `GROUP BY`** operations affecting performance.
  - **Inefficient pagination** using `LIMIT OFFSET`.

### **Optimizations Applied**:
  - Used **FULLTEXT INDEX** instead of `LIKE '%xxx%'` to speed up text searches.
  - Reduced **`LEFT JOIN` usage** and replaced with `EXISTS` where possible.
  - Reorganized the query to **remove unnecessary `GROUP BY` operations**.
  - Applied **Keyset Pagination** instead of `LIMIT OFFSET` for faster pagination.

## Total Time Spent
- A) Programming Test: 3 hours  
- B) SQL Improvement Logic Test: 2 day
