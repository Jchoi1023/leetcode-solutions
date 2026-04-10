# Write your MySQL query statement below
with first_login as (
    select player_id, MIN(event_date) as first_date
    from activity
    group by player_id
)

select ROUND(
        COUNT(DISTINCT a.player_id) * 1.0 / COUNT(DISTINCT f.player_id),
        2
    ) AS fraction
from first_login f
left join activity a on f.player_id = a.player_id
and a.event_date = date_add(f.first_date, interval 1 day)