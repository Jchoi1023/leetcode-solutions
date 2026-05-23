# Write your MySQL query statement below
with first_year as (
select * 
from(
    select product_id, year as first_year, quantity, price,
        dense_rank() over (partition by product_id order by year) as drn
    from sales
)t
    where drn = 1
)

select product_id, first_year, quantity, price
from first_year