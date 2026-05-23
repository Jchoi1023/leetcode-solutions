# Write your MySQL query statement below

-- With num_of_product as (
--     select count(distinct product_key) as num
--     from product
-- )

select customer_id
from customer
group by customer_id
having (select count(distinct product_key) as num
    from product) = count(distinct product_key)