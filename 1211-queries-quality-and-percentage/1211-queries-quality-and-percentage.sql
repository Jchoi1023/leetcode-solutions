# Write your MySQL query statement below

# quality rating / position
# poor query percentage = all queries with rating less than 3

-- select query_name, round(avg(rating/position),2) as poor_query_percentage
-- from queries 
-- group by query_name

select query_name, 
round(avg(rating/position),2) as quality,
round(sum(CASE WHEN rating < 3 then 1 else 0 end)/ count(rating)*100,2) as poor_query_percentage
from queries
group by query_name 