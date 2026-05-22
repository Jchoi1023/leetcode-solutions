# Write your MySQL query statement below

-- select activity_date as day
-- from activity
-- where activity_date between DATE_SUB('2019-07-27', interval 29 day) and '2019-07-27'



select activity_date as day, count(distinct user_id) as active_users
from activity
where activity_date between DATE_SUB('2019-07-27', interval 29 day) and '2019-07-27'
and activity_type is not null
group by activity_date