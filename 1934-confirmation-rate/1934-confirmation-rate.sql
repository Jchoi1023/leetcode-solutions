# Write your MySQL query statement below

# use case to count number of confirmed and timeout

select 
    s.user_id, 
   coalesce(round(sum(case when c.action = 'confirmed' then 1 else 0 end)/count(c.action),2), 0) as confirmation_rate
from signups s
left join confirmations c on s.user_id = c.user_id
group by user_id