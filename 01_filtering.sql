-- ============================================
-- 01 Filtering: WHERE, AND/OR, IN, BETWEEN
-- Table: payments
-- Reminder: if AND and OR are in one WHERE, use parentheses.
-- Reminder: "from / at least" -> >=, "more than" -> >
-- ============================================

-- 1. All payments from Ukraine
-- Goal: basic WHERE filter
-- (write your query here)
Select *
from payments
where country ='UA';

-- 2. Payments with amount > 50, sorted by amount (high to low)
-- (write your query here)
Select *
from payments 
where amount>50
order by amount desc;

-- 3. Approved payments with amount between 20 and 60 inclusive, sorted by amount DESC
-- (write your query here)
select *
from payments 
where status ='approved'
  and amount between 20 and 60 
order by amount desc;

-- 4. Declined payments, not visa, amount at least 40
-- (write your query here)
select*
from payments
where status = 'declined'
  and card_scheme <> 'visa'
  and amount >= 40
order by amount desc;

-- 5. Approved payments from UA or PL with amount < 20 or > 50
-- Hint to self: where do the parentheses go?
-- (write your query here)

SELECT *
from payments
WHERE status ='approved'
and country in ('UA','PL')
and amount not BETWEEN 20 AND 50;

-- 6. Payments where decline_code is NULL
-- Hint to self: IS NULL, not = NULL
-- (write your query here)

select *
from payments 
where decline_code is null;

