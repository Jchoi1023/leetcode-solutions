# Write your MySQL query statement below
-- ㅎㅇㅎㅇ
-- select customer_number from orders
-- group by customer_number
-- having max(count(order_number))

select customer_number from orders
group by customer_number
order by count(order_number) desc
limit 1
