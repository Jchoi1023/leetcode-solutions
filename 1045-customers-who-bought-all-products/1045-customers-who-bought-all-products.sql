# Write your MySQL query statement below

with cte as (
    select count(product_key) as cnt
    from product
)

select customer_id 
from customer
group by customer_id
having count( distinct product_key) = (select cnt from cte)