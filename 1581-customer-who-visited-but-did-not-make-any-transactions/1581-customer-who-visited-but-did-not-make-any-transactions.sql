# Write your MySQL query statement below

# visit_id o and no transction_id

with tran as ( 
    select 
    v.customer_id as customer_id,
    t.transaction_id as transaction_id,
    v.visit_id as visit_id
from visits v
left join transactions t on v.visit_id = t.visit_id
where t.transaction_id is null
)

select 
    customer_id,
    count(visit_id) as count_no_trans
from tran
group by customer_id

