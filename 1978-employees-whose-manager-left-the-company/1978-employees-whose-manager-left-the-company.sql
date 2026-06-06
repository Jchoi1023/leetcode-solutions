# Write your MySQL query statement below

# find the id, salary < 30000 and whose manager left the coompany
# manager who leaves, deleted from employee table, but report still have their manager_id.
with cte as(
select *
from employees
WHERE manager_id NOT IN (
    SELECT employee_id
    FROM employees
))

select employee_id 
from cte
where salary < 30000
order by employee_id