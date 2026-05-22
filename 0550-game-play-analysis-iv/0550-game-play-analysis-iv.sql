# Write your MySQL query statement below
# fraction = player logged in again on the day after the day they first logged in
# divide it by the number of total players
with first_order as
(
SELECT *
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn 
    FROM activity
) t
WHERE rn = 1
)

select  round(count(a.event_date) /count(f.event_date),2) as fraction
from first_order f 
left join activity a 
ON DATE_ADD(f.event_date, INTERVAL 1 DAY) = a.event_date
and f.player_id = a.player_id
