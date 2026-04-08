# Write your MySQL query statement below
with np as (
    select p.price as price, p.product_id as product_id , u.units as units
    from prices p
    left join unitssold u on p.product_id = u.product_id
    and u.purchase_date between p.start_date and p.end_date
)

select product_id, coalesce(round(sum(price * units)/sum(units),2),0) as average_price
from np
group by product_id