# Write your MySQL query statement below


with cnt_cus as (
    select customer_id, COUNT(DISTINCT product_key) AS cnt
    from customer
    group by customer_id
)

select customer_id
from cnt_cus
where cnt = (
    select  COUNT(DISTINCT product_key) 
    from product
    );