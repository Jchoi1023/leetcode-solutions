# Write your MySQL query statement below

# Let me clarify that I understand this questio correctly.
# So I need to get new price which updated before 2019-08-16.
# Price updated after 2019-08-16, should be 10.

# UNION - combine results
# product price updated before 2019-08-16
# product price 10 which didn't update the price before 2019-08-16

with cte as (
  select product_id, new_price as price, change_date,
ROW_NUMBER() OVER (partition by product_id order by change_date desc) as rn
from products  
where change_date <= "2019-08-16"
)

select product_id, price
from cte
where rn = 1

UNION 

select product_id, 10 as price
from products
group by product_id
having min(change_date) > '2019-08-16';