-- LC 1075: Project Employees I
-- Table: Project
-- +-------------+-------------+
-- | Column Name | Type        |
-- +-------------+-------------+
-- | project_id  | int         |
-- | employee_id | int         |
-- +-------------+-------------+
-- (project_id, employee_id) is the primary key.
-- employee_id is a foreign key to Employee.

-- Table: Employee
-- +------------------+--------------+
-- | Column Name      | Type         |
-- +------------------+--------------+
-- | employee_id      | int          |
-- | name             | varchar      |
-- | experience_years | int (NOT NULL) |
-- +------------------+--------------+
-- employee_id is the primary key.
-- Each row contains one employee’s info.

-- Goal:
-- For each project, compute the average experience_years of its employees,
-- rounded to 2 decimal places.

-- Approach:
-- 1. JOIN Project to Employee on employee_id.
-- 2. GROUP BY project_id.
-- 3. Use AVG() and ROUND(..., 2) to get the desired metric.

-- Time Complexity:
--  - JOIN and GROUP BY scan each table once: O(n + m), where
--    n = rows in Project, m = rows in Employee.
--  - Aggregation per project is linear in the number of project-employee links.

-- SQL Solution:
SELECT
  p.project_id,
  ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
  ON p.employee_id = e.employee_id
GROUP BY p.project_id;
