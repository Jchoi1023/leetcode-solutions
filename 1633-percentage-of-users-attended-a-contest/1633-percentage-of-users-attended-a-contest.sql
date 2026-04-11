# Write your MySQL query statement below
with cnt as (
    select count(user_id) as user_count
    from users
)

select contest_id, round(count(user_id)/(select user_count from cnt) * 100, 2) as percentage
from register 
group by contest_id
order by percentage desc, contest_id asc