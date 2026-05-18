# Write your MySQL query statement below

#purchase data between start and end date
--  p.start_date, p.end_date, p.price, u.purchase_date, u.units,
with cal as (
    select p.product_id, (p.price * u.units) as cal , u.units
-- (p.price*u.units)/sum(u.units) as average_price
from prices p
left join unitssold u on p.product_id = u.product_id 
and u.purchase_date between p.start_date and p.end_date
group by p.product_id, u.purchase_date
)

select product_id, coalesce(round(sum(cal)/sum(units),2),0) as average_price
from cal
group by product_id