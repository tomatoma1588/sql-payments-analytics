-- ============================================
-- Payments Analytics: schema and sample data
-- Synthetic data for learning purposes only.
-- Run in any SQLite client (e.g. sqliteonline.com).
-- ============================================

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS merchants;

-- One row = one payment attempt
CREATE TABLE payments (
  id           INTEGER,
  merchant     TEXT,
  country      TEXT,   -- UA, PL, DE
  card_scheme  TEXT,   -- visa, mastercard, amex
  amount       REAL,
  status       TEXT,   -- approved / declined
  decline_code TEXT,   -- NULL if approved
  created_at   TEXT    -- YYYY-MM-DD
);

INSERT INTO payments VALUES
(1,'ShopA','UA','visa',25.0,'approved',NULL,'2026-10-01'),
(2,'ShopA','UA','mastercard',40.0,'declined','insufficient_funds','2026-10-01'),
(3,'ShopB','PL','visa',15.5,'approved',NULL,'2026-10-02'),
(4,'ShopB','PL','visa',99.0,'declined','do_not_honor','2026-10-02'),
(5,'ShopA','DE','mastercard',60.0,'approved',NULL,'2026-10-03'),
(6,'ShopC','DE','amex',120.0,'declined','suspected_fraud','2026-10-03'),
(7,'ShopC','UA','visa',10.0,'approved',NULL,'2026-10-04'),
(8,'ShopB','UA','mastercard',33.0,'approved',NULL,'2026-10-04'),
(9,'ShopA','PL','amex',75.0,'declined','insufficient_funds','2026-10-05'),
(10,'ShopC','PL','visa',50.0,'approved',NULL,'2026-10-05');

-- One row = one merchant
CREATE TABLE merchants (
  merchant  TEXT,
  industry  TEXT,
  signed_at TEXT
);

INSERT INTO merchants VALUES
('ShopA','e-commerce','2026-01-10'),
('ShopB','gaming','2026-03-15'),
('ShopC','subscriptions','2026-06-01'),
('ShopD','travel','2026-09-20');  -- ShopD has no payments (useful for LEFT JOIN)
