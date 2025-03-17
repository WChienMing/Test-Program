# Test-Program

## 📌 Introduction

This repository contains my submission for:

- **A) Programming Test** (Web development using PHP & jQuery)
- **B) SQL Improvement Logic Test** (Optimizing a slow SQL query)

---

## 🗂️ **A) Programming Test**

### 📌 What's included in `A_Programming_Test/`:
- `index.html` → Frontend interface using jQuery.
- `poker.php` → Backend logic for distributing playing cards.
- `docker/` → Optional Docker environment to run the program.

### 🚀 **How to Run?**

#### **Method 1: Run Locally**
- Install **WAMP** or any local PHP server.
- Copy `A_Programming_Test/` folder into your server's web directory.
- Open your browser and visit:  
  `http://localhost/A_Programming_Test/index.html`

#### **Method 2: Run using Docker**
- Navigate to the `A_Programming_Test/` directory and run:
  ```bash
  docker-compose build
  docker-compose up -d

```md
## 📌 B) SQL Improvement Logic Test

📂 **What's included in `B_SQL_Improvement/`?**
- before.sql → Original slow query provided.
- database_setup.sql → Provided for reference/testing purposes only (Docker setup not fully completed).
- explanation.md → Written logical explanation of query improvements.
- docker/ → Optional Docker environment files to run MySQL (attempted setup, for reference only).

⚡ Issue Identified:
- Slow query (~8 seconds) caused by:
  - Full Table Scan (`LIKE '%xxx%'` usage).
  - Excessive LEFT JOIN clauses causing complexity.
  - Unnecessary GROUP BY clauses.
  - Inefficient pagination (`LIMIT OFFSET`).

🔧 Optimizations Applied:
- Implemented FULLTEXT INDEX to replace slow `LIKE '%xxx%'`.
- Reduced excessive LEFT JOIN statements, adopted EXISTS conditions.
- Removed unnecessary GROUP BY clauses.
- Switched to efficient Keyset Pagination instead of `LIMIT OFFSET`.
```

