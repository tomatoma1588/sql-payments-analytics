-- ============================================
-- 02 Aggregations: COUNT, SUM, AVG, GROUP BY, HAVING
-- Table: payments
-- Order of writing: SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT
-- Order of execution: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT
-- ============================================

-- 1. Total number of payments
SELECT
    COUNT(*) AS total_payments
FROM payments;


-- 2. Number of approved and declined payments
SELECT
    COUNT(CASE WHEN status = 'approved' THEN 1 END) AS approved_count,
    COUNT(CASE WHEN status = 'declined' THEN 1 END) AS declined_count
FROM payments;

-- 3. Average and maximum payment amount
SELECT
    ROUND(AVG(amount), 0) AS average_pay,
    MAX(amount) AS max_pay
FROM payments;


-- 4. Number of payments per country

SELECT
    country,
    COUNT(*) AS payment_count
FROM payments
GROUP BY country;

-- 5. Number of declines per decline_code (exclude NULL)
SELECT
    decline_code,
    COUNT(*) AS decline_count
FROM payments
WHERE status = 'declined'
    AND decline_code IS NOT NULL
GROUP BY decline_code;


-- 6. Sum of approved payments per merchant
SELECT
    merchant_id,
    SUM(amount) AS total_approved_amount
FROM payments
WHERE status = 'approved'
GROUP BY merchant_id;

-- 7. Count and average amount per card scheme (use clear aliases, no spaces)

SELECT
    card_scheme,
    COUNT(*) AS card_scheme_count,
    AVG(amount) AS average_amount_scheme
FROM payments
GROUP BY card_scheme;


-- 8. Countries with at least 2 approved payments
-- Needs: WHERE + GROUP BY + HAVING
SELECT
    country,
    COUNT(*) AS count_approved_payments
FROM payments
WHERE status = 'approved'
GROUP BY country
HAVING COUNT(*) >= 2;


-- 9. Countries with more than 2 payments
-- Needs: HAVING (COUNT cannot be used in WHERE)
SELECT
    country,
    COUNT(*) AS payments_count
FROM payments
GROUP BY country
HAVING COUNT(*) > 2;
