# Write your MySQL query statement below

# managers with at least five direct reports
# any order

with cnt as(
    select e1.id, e1.name as name, count(e2.id) as count
from employee e1
join employee e2 on e1.id = e2.managerId
group by e2.managerid
)
select name 
from cnt
where count >= 5
