# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from (
    select num,
    LAG(num, 1) over (order by id) as prev1,
    LAG(num, 2) over (order by id) as prev2
    from logs
) t
where prev1 = num and prev2 = num