# Write your MySQL query statement below
WITH cnt AS (
    SELECT *,
           COUNT(*) OVER (PARTITION BY employee_id) AS cnt
    FROM employee
)
SELECT employee_id, department_id
FROM cnt
WHERE (cnt >= 2 AND primary_flag = 'Y')
   OR (cnt = 1 AND primary_flag = 'N');