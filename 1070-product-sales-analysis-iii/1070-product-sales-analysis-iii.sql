# Write your MySQL query statement below
# Subquery and Join
select s.product_id, s.year as first_year, s.quantity, s.price
from sales s
JOIN (
    select product_id, MIN(year) as first_year
    from sales 
    group by product_id
) t
on s.product_id = t.product_id
AND s.year = t.first_year