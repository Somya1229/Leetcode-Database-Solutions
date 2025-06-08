-- LC 1070: Product Sales Analysis III
-- Table: Sales
-- +------------+-------+
-- | Column Name| Type  |
-- +------------+-------+
-- | sale_id    | int   |
-- | product_id | int   |
-- | year       | int   |
-- | quantity   | int   |
-- | price      | int   |
-- +------------+-------+
-- (sale_id, year) is the primary key.
-- product_id is a foreign key to Product.
--
-- Goal: For each product, return all sales that occurred in its first year.

-- Approach 1: JOIN on subquery of MIN(year)
-- 1. Compute each product's first_year.
-- 2. Join back to Sales to filter rows from that year.

SELECT
  s.product_id,
  s.year      AS first_year,
  s.quantity,
  s.price
FROM Sales s
JOIN (
  SELECT
    product_id,
    MIN(year) AS first_year
  FROM Sales
  GROUP BY product_id
) AS fs
  ON s.product_id = fs.product_id
 AND s.year       = fs.first_year;

-- Approach 2: Tuple-IN (standard SQL, may require ROW() in some MySQL versions) 
-- Filters Sales to only those rows whose (product_id, year) pair
-- matches the (product_id, min_year) computed per product.

SELECT
  product_id,
  year       AS first_year,
  quantity,
  price
FROM Sales
WHERE (product_id, year) IN (
  SELECT
    product_id,
    MIN(year)
  FROM Sales
  GROUP BY product_id
);

/* Prefer First approach as The tuple-IN syntax is standard SQL
 but MySQL’s support can vary by version, but JOIN version is functionally equivalent, 
 universally supported, and often performs better */