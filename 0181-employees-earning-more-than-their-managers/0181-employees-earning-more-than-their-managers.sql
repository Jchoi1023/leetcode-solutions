# Write your MySQL query statement below
select e.name as Employee
from employee e
join employee s on e.managerId = s.id 
where e.salary > s.salary

