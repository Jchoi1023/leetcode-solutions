# Write your MySQL query statement below
select 
round(SUM(case 
        when order_date = customer_pref_delivery_date then 1 else 0 end)/count(delivery_id)*100,2)
as immediate_percentage
from delivery d
where order_date = (
    select MIN(order_date)
    from delivery
    where d.customer_id = customer_id
)