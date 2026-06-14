# Write your MySQL query statement below

# number of different products sold for each date


select sell_date, count(distinct product) as num_sold, 
group_concat(
    distinct product
    order by product
    SEPARATOR ','
) as products
from activities
group by sell_date