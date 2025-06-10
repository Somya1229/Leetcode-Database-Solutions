-- LC 1084: Sales Analysis III
-- Table: Product
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- | unit_price   | int     |
-- +--------------+---------+
-- product_id is the primary key for Product.

-- Table: Sales
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | seller_id   | int     |
-- | product_id  | int     |
-- | buyer_id    | int     |
-- | sale_date   | date    |
-- | quantity    | int     |
-- | price       | int     |
-- +-------------+---------+
-- Sales may have duplicates; product_id references Product.

-- Goal:
-- Report products sold **only** in Q1 2019 (2019-01-01 to 2019-03-31 inclusive).

-- Approach:
-- 1. Filter Sales to Q1 2019.
-- 2. Group by product_id and check:
--    - MIN(sale_date) >= '2019-01-01'
--    - MAX(sale_date) <= '2019-03-31'
-- 3. Join with Product to get product_name.

-- Time Complexity:
-- Single scan of Sales (O(n)), grouping and filtering are linear. Join back to Product is O(m) where m = number of qualifying products.

SELECT
  p.product_id,
  p.product_name
FROM Product p
JOIN (
  SELECT
    product_id
  FROM Sales
  GROUP BY product_id
  HAVING MIN(sale_date) >= '2019-01-01'
     AND MAX(sale_date) <= '2019-03-31'
) AS q1_products
  ON p.product_id = q1_products.product_id;
