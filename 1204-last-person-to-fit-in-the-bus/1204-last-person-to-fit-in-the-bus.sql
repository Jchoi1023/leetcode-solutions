# Write your MySQL query statement below

# I need to use window function, sum() over()
# I need to get culumate sum and which isn't over 1000 kg.

with cte as (
    select person_name, weight, turn,
    sum(weight) over(order by turn) as total_weight
    from queue
)

select person_name
from cte
where total_weight <= 1000
order by total_weight desc
limit 1
