# SQL Performance Improvement - Logical Explanation

## 1. Why is the original SQL slow?
The original SQL query takes around 8 seconds, which is too slow for a search operation.  
After analyzing the query, I found several key performance issues:

### 1.1 `LIKE '%xxx%'` causes a full table scan
- The query uses `LIKE '%キャビンアテンダント%'` across multiple tables.
- **Issue:** Since `%` is at the beginning of the string, MySQL cannot use indexes, forcing a full table scan.
- **Impact:** The larger the dataset, the longer it takes to find matching results.

### 1.2 Too many `LEFT JOIN` operations
- The query includes 9 `LEFT JOIN`, pulling data from many related tables.
- **Issue:** Some `LEFT JOIN` are unnecessary and introduce duplicate data, making MySQL process more rows than needed.
- **Impact:** More data to process = slower query.

### 1.3 `GROUP BY Jobs.id` increases unnecessary computation
- **Problem:** Because of `LEFT JOIN`, duplicate `Jobs.id` values appear, requiring `GROUP BY Jobs.id` to remove duplicates.
- **Impact:** MySQL must first sort and group the data before filtering, which adds extra processing time.

### 1.4 `LIMIT OFFSET` makes pagination slow
- **Problem:** Using `LIMIT 50 OFFSET 10000`, MySQL reads 10,050 rows but only returns 50.
- **Impact:** As OFFSET increases, response time increases significantly.

---

## 2. How did I improve the query?
To speed up the query, I applied four key optimizations:

### 2.1 Use `FULLTEXT INDEX` instead of `LIKE '%xxx%'`
**Solution**: Add `FULLTEXT INDEX` to columns used for searching and replace `LIKE` with `MATCH() AGAINST()`.  
**Benefit**: MySQL avoids full table scan and uses a much faster full-text search engine.

### 2.2 Reduce `LEFT JOIN` usage
**Solution**: Remove unnecessary `LEFT JOIN` and use `EXISTS` where possible.  
**Benefit**: Reduces data duplication and speeds up query execution.

### 2.3 Avoid `GROUP BY` when possible
**Solution**: Fetch `Jobs` first, then join additional data.  
**Benefit**: Eliminates the need for `GROUP BY`, making sorting and filtering much faster.

### 2.4 Optimize pagination with Keyset Pagination
**Solution**: Replace `LIMIT OFFSET` with `WHERE Jobs.id < (SELECT id FROM jobs ORDER BY id DESC LIMIT 50,1)`.  
**Benefit**: Instead of scanning all previous rows, MySQL can directly jump to the correct position.

