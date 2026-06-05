# Write your MySQL query statement below

# has all people info
# person_id 1 to n, n is the number of row in the table
# turn = 1 the first person to board, turn = n the last person to board

# limit 1000 kg

with cte as (
    select person_name,
sum(weight) over (order by turn) as total_weight
from queue
)

select person_name
from cte
where total_weight <= 1000
order by total_weight desc
limit 1

