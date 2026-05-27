# Write your MySQL query statement below

# five direct reports

select e1.name
from employee e1
left join employee e2 on e1.id = e2.managerId
group by e1.id
having count(e1.id) >= 5