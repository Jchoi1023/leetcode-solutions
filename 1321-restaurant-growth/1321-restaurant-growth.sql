# Write your MySQL query statement below

# Analyze a possible expansion ( at least one customer every day)
# moving average for seven days 

# for the moving average, I need to calculate daily total first.

with cte as (
    select visited_on, sum(amount) as dailyTotal
    from customer
    group by visited_on 
),

# need to get cumulated sum for 7 days to calculate moving average

rolling as (
    select visited_on,
    sum(dailyTotal) over(order by visited_on rows between 6 preceding and current row) as amount,
    count(*) over (order by visited_on rows between 6 preceding and current row) as days
    from cte
)

select 
    visited_on,
    amount,
    round(amount/7, 2) as average_amount
from rolling
where days = 7

