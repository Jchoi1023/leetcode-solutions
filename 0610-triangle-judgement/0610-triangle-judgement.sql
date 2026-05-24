# Write your MySQL query statement below

select 
    x, 
    y,
    z,
    CASE
        WHEN x + y + z - GREATEST(x, y, z) > GREATEST(x, y, z) THEN 'Yes' ELSE 'No'
    END AS triangle
from triangle