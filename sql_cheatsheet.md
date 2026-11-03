# SQL Cheatsheet (my notes)

## Query skeleton
```sql
SELECT   what to show
FROM     which table
WHERE    filter rows (before grouping)
GROUP BY "per each X"
HAVING   filter groups (after grouping)
ORDER BY sorting (DESC = high to low)
LIMIT    how many rows
```

## Execution order
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT

## Task wording -> SQL
| Task says | Write |
|---|---|
| "payments where..." | WHERE |
| "per each country / merchant" | GROUP BY + that column in SELECT |
| "how many" | COUNT(*) |
| "sum / average / max" | SUM / AVG / MAX |
| "only groups with more than N" | HAVING |
| "top N" | ORDER BY ... DESC LIMIT N |
| "share / rate" | AVG(CASE WHEN ... THEN 1.0 ELSE 0 END) |

## AND / OR / boundaries
- AND runs before OR. With both in one WHERE, use parentheses.
- "from / at least" -> >=, "more than" -> >, "up to / at most" -> <=
- BETWEEN includes both ends.

## JOIN
- INNER JOIN: only matches
- LEFT JOIN: everything from the left table, NULL if no match

## My mistakes (check before running a query)
- [ ] Extra quote in a string value
- [ ] Space inside an alias (use payment_count)
- [ ] > instead of >=
- [ ] COUNT in WHERE (use HAVING)
- [ ] = NULL (use IS NULL)
- [ ] Column in SELECT but not in GROUP BY
