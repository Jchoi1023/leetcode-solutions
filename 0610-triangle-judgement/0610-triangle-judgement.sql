# Write your MySQL query statement below
select x, y, z, 
case
    when x <= 0 or y <= 0 or z <=0 then 'No'
    when greatest(x,y,z) < (x+y+z-greatest(x,y,z)) then 'Yes' 
    else 'No'
end as triangle
from triangle;