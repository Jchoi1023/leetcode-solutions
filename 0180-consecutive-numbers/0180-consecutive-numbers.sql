# Write your MySQL query statement below

# Let me make sure that I understand correctly.
# number appear at least three times consecutively.

# LAG returns previous row value, so I need to compare current row and previous, and previous row and before that. window function
# LAG if there is no value in the previous two rows, it returns NULL, not error.
with cte as (
    select num,
    LAG(num) over (order by id) as pre_num,
    LAG(num, 2) over (order by id) as pre_before_num
    from logs
)   

select distinct num as ConsecutiveNums
from cte
where num = pre_num
and pre_num = pre_before_num