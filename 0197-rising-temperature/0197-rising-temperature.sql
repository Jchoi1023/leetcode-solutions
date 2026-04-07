# Write your MySQL query statement below
select w1.id
from weather w1
left join weather w2 on (w2.recordDate + interval 1 day) = w1.recordDate
where w1.temperature - w2.temperature > 0
