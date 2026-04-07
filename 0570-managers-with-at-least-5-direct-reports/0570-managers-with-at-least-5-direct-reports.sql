# Write your MySQL query statement below
with count_emp as (
select e1.id, e1.name as name,  count(e2.id) as cnt
from employee e1
left join employee e2 on e1.id = e2.managerid
group by e1.id, e1.name
)

select name 
from count_emp
where cnt >= 5