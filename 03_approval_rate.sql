-- ============================================
-- 03 Approval rate and payment metrics
-- Table: payments
-- Pattern: AVG(CASE WHEN status = 'approved' THEN 1.0 ELSE 0 END)
-- ============================================

-- 1. Approval rate per country
SELECT
    country,
    AVG(
        CASE
            WHEN status = 'approved' THEN 1.0
            ELSE 0
        END
    ) AS approval_rate
FROM payments
GROUP BY country;


-- 2. Approval rate per card scheme, worst to best
SELECT
    card_scheme,
    AVG(
        CASE
            WHEN status = 'approved' THEN 1.0
            ELSE 0
        END
    ) AS approval_rate
FROM payments
GROUP BY card_scheme
ORDER BY approval_rate ASC;


-- 3. Approval rate per merchant
SELECT
    merchant,
    AVG(
        CASE
            WHEN status = 'approved' THEN 1.0
            ELSE 0
        END
    ) AS approval_rate
FROM payments
GROUP BY merchant
ORDER BY approval_rate ASC;


-- 4. Approval rate per country and card scheme
SELECT
    country,
    card_scheme,
    AVG(
        CASE
            WHEN status = 'approved' THEN 1.0
            ELSE 0
        END
    ) AS approval_rate
FROM payments
GROUP BY country, card_scheme;


-- 5. Share of each decline code among declines (%)
SELECT
    decline_code,
    COUNT(*) AS declined_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM payments
WHERE status = 'declined'
  AND decline_code IS NOT NULL
GROUP BY decline_code
ORDER BY percentage DESC;


-- 6. Declined payment volume per country
SELECT
    country,
    SUM(
        CASE
            WHEN status = 'declined' THEN amount
            ELSE 0
        END
    ) AS declined_amount
FROM payments
GROUP BY country
ORDER BY declined_amount DESC;


-- 7. Daily approval rate (%)
SELECT
    DATE(created_at) AS payment_date,
    ROUND(
        COUNT(
            CASE
                WHEN status = 'approved' THEN 1
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS approval_rate
FROM payments
GROUP BY DATE(created_at)
ORDER BY payment_date;

-- Takeaway (1-2 sentences, in English):
-- e.g. "Approval rate is lowest for ..., mainly because of ..."
