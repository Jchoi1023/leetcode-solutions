# Write your MySQL query statement below
# primary department for each employee

# count(*) = 1, then department_id,
# count(*) > 1, then to find primary_flag = 'Y'

select employee_id, 
CASE WHEN count(*) = 1 THEN department_id
    when count(*) > 1 then MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)
    END AS department_id
from employee
group by employee_id