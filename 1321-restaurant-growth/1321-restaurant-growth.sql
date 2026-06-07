# Write your MySQL query statement below

# at least one customer every day
# moving average = customer paid in a seven days window

# need to sum daily amount first
with daily as (
select visited_on,
sum(amount) as amount
from customer
group by visited_on
),

rolling as (
    select visited_on, 
    sum(amount) OVER (
        order by visited_on
        rows between 6 preceding and current row
    ) as amount,
    count(*) OVER(
        order by visited_on
        rows between 6 preceding and current row
    ) as day_count
    from daily
)

select visited_on, amount, round(amount/7, 2) as average_amount
from rolling
where day_count = 7

