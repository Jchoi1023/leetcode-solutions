# Write your MySQL query statement below
with cte as(
select num,
LAG(num, 1) OVER(order by id) as prev1,
LAG(num, 2) OVER(order by id) as prev2
from logs
)

select distinct num as ConsecutiveNums
from cte
where num = prev1 and num = prev2