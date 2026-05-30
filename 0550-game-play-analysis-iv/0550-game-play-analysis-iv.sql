# Write your MySQL query statement below
# self joint with the date and player_id
with cte as (
    select a1.player_id as total_player, 
    a1.event_date as event, 
    a2.player_id as player, 
    a2.event_date as date,
        ROW_NUMBER() OVER (
            PARTITION BY a1.player_id
            ORDER BY a1.event_date
           ) AS rn    
    from activity a1
    left join activity a2 on DATE_ADD(a1.event_date, interval 1 day) = a2.event_date
    and a1.player_id = a2.player_id
)

select round(count(distinct player)/count(distinct total_player),2) as fraction
from cte
where rn = 1