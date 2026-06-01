# Write your MySQL query statement below
with cte as (
select m1.num as num, count(m2.num) as cnt
from mynumbers m1
left join mynumbers m2 on m1.num = m2.num
group by m1.num
)

select coalesce(max(num), null) as num
from cte
where cnt = 1