# Write your MySQL query statement below
select e1.name
from employee e1
left join employee e2 on e1.id = e2.managerid
WHERE e2.managerid IS NOT NULL
GROUP BY e1.id, e1.name
HAVING COUNT(e2.id) >= 5;


