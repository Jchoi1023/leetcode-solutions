# Write your MySQL query statement below

# immediate : order_date = pref_delivery_date, otherwise : scheduled

# count all first order
# count first order and immediate
with count as (
select count(*) as cnt
from (
    select *, 
    row_number() over (partition by customer_id order by order_date) as rn 
    from delivery) t
where rn = 1
and order_date = customer_pref_delivery_date
)

select round((select cnt from count)/count( distinct customer_id)*100,2) as immediate_percentage
from delivery


