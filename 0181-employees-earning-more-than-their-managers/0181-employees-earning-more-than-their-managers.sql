# Write your MySQL query statement below
select e.name as Employee
from employee e
left join employee m on m.id = e.managerid
where e.salary > m.salary;