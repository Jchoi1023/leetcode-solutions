# Write your MySQL query statement below

select employee_id,
case when count(*) = 1 then department_id
     when count(*) > 1 then MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)
      END AS department_id
    FROM employee
    GROUP BY employee_id
