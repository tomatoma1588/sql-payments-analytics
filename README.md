# SQL Payments Analytics

Practice project: analyzing payment data with SQL. The goal is to learn how to measure payment performance (approval rate, decline reasons, revenue loss) and to write clean, readable queries.

## Dataset

Synthetic data, created for learning. No real payment data is used.

**payments**

| Column | Description |
|---|---|
| id | Payment ID |
| merchant | Merchant name |
| country | Customer country (UA, PL, DE) |
| card_scheme | visa / mastercard / amex |
| amount | Payment amount |
| status | approved / declined |
| decline_code | Reason for decline (NULL if approved) |
| created_at | Payment date |

**merchants**

| Column | Description |
|---|---|
| merchant | Merchant name |
| industry | Merchant industry |
| signed_at | Contract date |

To create the tables and data, run `data/payments.sql` in any SQLite client (for example, sqliteonline.com).

## Structure

```
data/payments.sql          # tables and sample data
queries/
  01_filtering.sql         # WHERE, AND/OR, IN, BETWEEN
  02_aggregations.sql      # COUNT, SUM, AVG, GROUP BY, HAVING
  03_approval_rate.sql     # payment metrics
  04_joins.sql             # INNER JOIN, LEFT JOIN
notes/sql_cheatsheet.md    # my notes and common mistakes
```

## Example: approval rate by country

```sql
SELECT country,
       AVG(CASE WHEN status = 'approved' THEN 1.0 ELSE 0 END) AS approval_rate
FROM payments
GROUP BY country;
```

Result: [paste your result or a short table here]

Takeaway: [one sentence, e.g. "Approval rate is lowest in PL, mostly because of insufficient_funds declines"]

## Topics covered

- [x] Filtering: WHERE, AND/OR, IN, BETWEEN
- [x] Aggregation: COUNT, SUM, AVG, GROUP BY, HAVING
- [x] Approval rate with CASE WHEN
- [ ] JOIN (INNER, LEFT)
- [ ] CTE and window functions

## Next steps

- Add JOIN, CTE and window function queries
- Repeat the analysis in Python (pandas)
- Build a dashboard in Tableau Public

## About

Junior analyst in training, interested in payments analytics. Feedback is welcome.
