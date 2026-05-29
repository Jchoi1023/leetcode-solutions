# Write your MySQL query statement below


# # of the users registered in each contest / # of total users
# each contest = group by contest

with cte as (
    select count(distinct user_id) as cnt
    from users
)

select contest_id, round(count(user_id)/(select cnt from cte)*100,2) as percentage
from register
group by contest_id
order by percentage desc, contest_id asc