# SQL Payments Analytics

Practice project: analyzing payment data with SQL. The goal is to learn how to measure payment performance (approval rate, decline reasons, declined payment volume) and to write clean, readable queries.

## Dataset

Synthetic data, created for learning. No real payment data is used.

**payments**

| Column | Description |
|---|---|
| id | Payment attempt ID |
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

To create the tables and sample data, run `payments.sql` in any SQLite client (for example, sqliteonline.com).

## Structure

```text
sql-payments-analytics/
├── payments.sql
├── 01_filtering.sql
├── 02_aggregations.sql
├── 03_approval_rate.sql
├── 04_joins.sql
├── sql_cheatsheet.md
└── README.md
```

## Example: Approval Rate by Country

```sql
SELECT
    country,
    AVG(CASE WHEN status = 'approved' THEN 1.0 ELSE 0 END) AS approval_rate
FROM payments
GROUP BY country;
```

*Results and business insights will be added after completing the analysis.*

## Topics Covered

- Filtering: WHERE, AND/OR, IN, BETWEEN
- Aggregation: COUNT, SUM, AVG, GROUP BY, HAVING
- Approval Rate with CASE WHEN
- Payment performance analysis

## Next Steps

- Complete JOIN analysis (INNER JOIN, LEFT JOIN)
- Practice CTEs and window functions
- Analyze payment trends over time
- Reproduce the analysis using Python (pandas)
- Build a dashboard in Tableau Public

## About

Junior analyst in training, interested in payment analytics. Feedback is welcome.
