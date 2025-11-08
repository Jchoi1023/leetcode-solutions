# Write your MySQL query statement below

select round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)/count(*) *100, 2)
AS immediate_percentage
from (
    select customer_id, order_date, customer_pref_delivery_date
    from delivery
    where (customer_id, order_date) IN (
        select customer_id, MIN(order_date)
        from delivery
        GROUP by customer_id
    )
    )as first_orders;