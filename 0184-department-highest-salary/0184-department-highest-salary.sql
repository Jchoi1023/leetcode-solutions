# Write your MySQL query statement below



select department, employee, salary 
from(
select d.name as department, e.name as employee, e.salary as salary,
RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
from employee e
left join department d on e.departmentid = d.id
) t
where rnk = 1