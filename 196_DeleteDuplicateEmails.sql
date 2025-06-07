-- LC 196: Delete Duplicate Emails
/*

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
For Pandas users, please note that you are supposed to modify Person in place.
After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.
*/

-- Explanation:
-- We perform a self-join of the Person table (p1) against itself (p2)
-- on matching emails. For any pair where p1.id > p2.id, p1 is a duplicate
-- (higher id) and should be removed. This ensures that only the lowest-id
-- row for each email remains.

-- Time Complexity:
-- Deleting via a join scans the table and performs lookups on the join key.
-- If there is an index on `email` and on `id`, the operation runs in roughly
-- O(n log n) time. Without indexes it may approach O(n²) in the worst case.

DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id    > p2.id;
