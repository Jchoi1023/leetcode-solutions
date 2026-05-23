# Write your MySQL query statement below

# employee_id = department_id -> department_ id is primary
# employee_id != department_id -> primary flag Y 

WITH cte AS
(
    SELECT
        employee_id,
        CASE
            WHEN COUNT(*) = 1 THEN MAX(department_id)
            WHEN COUNT(*) > 1 THEN MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)
        END AS department_id
    FROM employee
    GROUP BY employee_id
)

SELECT * FROM cte
WHERE department_id IS NOT NULL;