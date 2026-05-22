# Write your MySQL query statement below

# count the number of total players
# logged in again on the day after the day first logged in -> fraction
with cnt as
(
select count(distinct t.player_id) as cnt
from
(
select a2.player_id, row_number() over (partition by a1.player_id order by a1.event_date) as rn
from activity a1
left join activity a2 on DATE_ADD(a1.event_date, interval 1 day) = a2.event_date 
and a1.player_id = a2.player_id
)t
where rn =1

)

select round((select cnt from cnt)/count(distinct player_id),2) as fraction
from activity

