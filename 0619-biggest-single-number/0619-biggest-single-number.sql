# Write your MySQL query statement below
with max as
(
select n1.num as number, count(n2.num)
from mynumbers n1
join mynumbers n2 on n1.num = n2.num
group by n2.num
having count(n2.num) = 1
)

select max(number) as num
from max
