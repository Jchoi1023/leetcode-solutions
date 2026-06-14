# Write your MySQL query statement below
WITH cte AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS dr
    FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary
FROM cte
WHERE dr = 2;