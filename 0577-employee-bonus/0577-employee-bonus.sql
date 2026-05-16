# Write your MySQL query statement below

# where bonus < 1000 and bonus is null

select e.name, b.bonus
from employee e
left join bonus b on e.empid = b.empid
where b.bonus < 1000 or b.bonus is null
