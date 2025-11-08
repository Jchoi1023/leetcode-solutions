# Write your MySQL query statement below
select id from 
(
    select c.id, c.temperature as current, p.temperature as previous from weather c
    join weather p on datediff(c.recordDate, p.recordDate) = 1
    where c.temperature > p.temperature
) as t
