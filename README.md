## Test-Program Introduction
This repository contains my submission for:
- **A) Programming Test** (Web development using PHP & jQuery)
- **B) SQL Improvement Logic Test** (Optimizing a slow SQL query)


## 🚩 A) Programming Test
### 📌 What is inside `A_Programming_Test/`?
- `index.html` → Frontend interface built using jQuery.
- `poker.php` → Backend logic for distributing playing cards.
- `docker/` → Optional Docker environment setup to run the PHP application.
### 🚀 How to Run?
#### 🔧 Method 1: Run Locally
  - Install **WAMP** or any local PHP server.
  - Place the `A_Programming_Test` folder into your server's web directory.
  - Open your browser at:  

  ```
  http://localhost/A_Programming_Test/index.html
  ```
#### 🔧 Method 2: Run with Docker
  - Navigate to the `A_Programming_Test/docker` folder in terminal.
  - Execute:
  
  ```bash
  docker-compose build
  docker-compose up -d
  ```
  - Visit:
  
  ```
  http://localhost:8080
  ```


## 🚩 B) SQL Improvement Logic Test
### 📌 What is inside `B_SQL_Improvement/`?
- `before.sql` → Original slow SQL query provided for reference.
- `database_setup.sql` → This file is created for testing purposes only.
- `explanation.md` → Logical explanation of SQL query improvements.
- `docker/` → Optional Docker environment for MySQL testing.
### 🐞 Identified Issues:
- Original query execution was slow (**~8 seconds**):
  - Caused by **Full Table Scan** (`LIKE '%xxx%'` searches).
  - Excessive usage of **LEFT JOIN**, causing high processing overhead.
  - Unnecessary use of **GROUP BY** clauses.
  - Inefficient pagination (`LIMIT OFFSET`) implementation.
### 🚀 Optimizations Applied:
- Introduced **FULLTEXT INDEX** to replace slow `LIKE '%xxx%'` searches.
- Reduced complexity by minimizing unnecessary `LEFT JOIN`s, replacing them with `EXISTS` statements.
- Removed redundant `GROUP BY` operations for efficiency.
- Implemented **Keyset Pagination** to replace inefficient `LIMIT OFFSET`.


## Total Time Spent
- A) Programming Test: 3 hours  
- B) SQL Improvement Logic Test: 2 day
