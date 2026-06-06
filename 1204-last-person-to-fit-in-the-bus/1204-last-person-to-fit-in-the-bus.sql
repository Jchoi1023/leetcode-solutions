# Write your MySQL query statement below
# window funciton allows me to calculate across related rows, while keeping 
# original rows in the result set.
# sum
with cte as (
select *,
SUM(weight) over (order by turn) as Total_Weight
from queue
)
select person_name
from cte
where Total_weight <= 1000
order by Total_weight desc
limit 1