# Write your MySQL query statement below

# higher temp compared to its previous dates
# join with the same table to compare temp with the date


select 
    w2.id
    -- w1.recorddate,
    -- w2.recorddate,
    -- w1.temperature,
    -- w2.temperature, 
    -- w1.id
from weather w1
left join weather w2 ON DATE_ADD(w1.recordDate, INTERVAL 1 DAY) = w2.recordDate
where w1.temperature < w2.temperature
