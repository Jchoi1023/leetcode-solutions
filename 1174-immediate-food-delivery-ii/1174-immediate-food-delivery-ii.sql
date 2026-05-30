# Write your MySQL query statement below
# pref delivery date = the order date -> immediate, otherwise -> schedule
# first order.

#rank() over to get the first order

WITH cte AS (
    SELECT customer_id, order_date, customer_pref_delivery_date,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date
           ) AS rn
    FROM delivery
)

select 
round(sum(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)/count(customer_id)*100,2) as immediate_percentage from cte
where rn = 1
