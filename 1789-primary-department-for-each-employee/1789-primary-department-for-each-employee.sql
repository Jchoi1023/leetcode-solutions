# Write your MySQL query statement below
# emplyee_id = department_id if they belong to only one dept.

select employee_id,  department_id
from Employee
where primary_flag = "Y"

UNION

select employee_id, department_id
from employee
group by employee_id
having count(*) = 1
