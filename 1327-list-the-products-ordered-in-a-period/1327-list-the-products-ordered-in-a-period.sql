# Write your MySQL query statement below

# name of products that have at lease 100 units ordered in Feb 2020
with cte as (
    select p.product_id, p.product_name, p.product_category, o.order_date, o.unit
    from products p 
    left join orders o on p.product_id = o.product_id
    where o.order_date between '2020-02-01' and '2020-02-29'
)

select product_name, sum(unit) as unit
from cte
group by product_name
having sum(unit) >= 100