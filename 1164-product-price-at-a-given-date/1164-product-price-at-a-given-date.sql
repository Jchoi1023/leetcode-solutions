# Write your MySQL query statement below

# some product was changed to a new price at some date.
# all products have price 10
# on the date 2019-08-16
# any order

# latest price change before 2019-08-16
# changed after 2019-08-16, then 10
select product_id, new_price as price from (
    select product_id, new_price,
    ROW_NUMBER() over (partition by product_id order by change_date desc) as rn
    from products
    where change_date <= '2019-08-16'
) t
where rn = 1

UNION

select product_id, 10 as price
from products
group by product_id
having min(change_date) > '2019-08-16'




