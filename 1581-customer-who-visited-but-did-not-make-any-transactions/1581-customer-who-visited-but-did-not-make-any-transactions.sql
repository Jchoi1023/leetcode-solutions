# Write your MySQL query statement below
WITH cte as
(
select v.customer_id, 
        v.visit_id,
        t.transaction_id
from visits v
left join transactions t on v.visit_id = t.visit_id
where t.transaction_id IS NULL
)

select customer_id, count(visit_id) as count_no_trans
from cte
group by customer_id
