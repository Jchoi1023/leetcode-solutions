# Write your MySQL query statement below
with cnt_confirm as(
select user_id,
    case 
    when action = 'confirmed' then 1
    else 0
    end as confirmation
from confirmations
)

select s.user_id, 
coalesce(round(sum(cn.confirmation)/count(c.time_stamp),2),0) as confirmation_rate
from signups s
left join confirmations c on s.user_id = c.user_id
left join cnt_confirm cn on cn.user_id = s.user_id
-- where s.time_stamp <= c.time_stamp
group by s.user_id