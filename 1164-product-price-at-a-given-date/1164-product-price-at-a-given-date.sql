# Write your MySQL query statement below

# find the prices of all products on the date 2019-08-16
WITH cte as 
(
select product_id, new_price, change_date
from products
where (product_id, change_date) IN (
    select product_id, MAX(change_date)
    from products
    where change_date <= '2019-08-16'
    group by product_id)
    )


select distinct p1.product_id, CASE WHEN c.new_price IS NOT NULL then c.new_price else 10 end as price from products p1
left join cte c on p1.product_id = c.product_id