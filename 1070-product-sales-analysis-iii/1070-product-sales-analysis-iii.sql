# Write your MySQL query statement below

# first year each product was sold
# create cte for finding the first year 
# And then filtering with this 

with cte as(
    select product_id, quantity, price, year as first_year,
    dense_rank() over(partition by product_id order by year) as rn 
    from sales
) 

select product_id, first_year, quantity, price
from cte
where rn = 1