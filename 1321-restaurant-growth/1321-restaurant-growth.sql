# Write your MySQL query statement below

# need to the total of each day
with cte as
(
   select 
    customer_id, 
    name, 
    visited_on, 
    sum(amount) as dailyTotal
from customer
group by visited_on 
),

# need to get cumulated sum for 7 days to calculate moving average
rolling as(
select 
    visited_on,
    SUM(dailyTotal) OVER(order by visited_on rows between 6 preceding and current row ) as amount,
    count(*) OVER (order by visited_on rows between 6 preceding and current row ) as days
from cte
)

select 
    visited_on,
    amount,
    round(amount/7, 2) as average_amount
from rolling
where days = 7