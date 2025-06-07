-- LC 610: Triangle Judgement
-- Table: Triangle
-- +------+------+------+
-- | x    | y    | z    |
-- +------+------+------+
-- | int  | int  | int  |
-- +------+------+------+
-- (x, y, z) is the primary key.
--
-- Each row contains the lengths of three line segments.
-- We need to report whether those segments can form a valid triangle.
-- A triangle is valid if and only if the sum of any two sides
-- is strictly greater than the third side.

-- Explanation:
-- For each triplet (x, y, z), check the three triangle inequalities:
--   x + y > z
--   x + z > y
--   y + z > x
-- If all hold, label 'Yes'; otherwise, label 'No'.

-- Time Complexity:
-- This single‐scan query runs in O(n), where n = number of rows in Triangle.
-- Each row performs a constant number of arithmetic and boolean checks.

-- Approach 1: Using IF()
SELECT
  x,
  y,
  z,
  IF(x + y > z
     AND x + z > y
     AND y + z > x,
     'Yes', 'No') AS triangle
FROM Triangle;

-- Approach 2: Using CASE
SELECT
  x,
  y,
  z,
  CASE
    WHEN x + y > z
      AND x + z > y
      AND y + z > x
    THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM Triangle;
