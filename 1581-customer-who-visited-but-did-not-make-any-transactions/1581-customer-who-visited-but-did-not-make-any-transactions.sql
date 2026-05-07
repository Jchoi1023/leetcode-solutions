# Write your MySQL query statement below

# if they visited twice a day, then they had a different id?
# no transactions and how many times did they do?
# no tran_id means no visited_id?

WITH ctn AS (
    select v.customer_id as customer_id, 
        t.visit_id as visited_id,
        t.transaction_id
    from visits v
    left join transactions t on v.visit_id = t.visit_id 
    where t.transaction_id is NULL

)

select
    customer_id, count(customer_id) as count_no_trans
from ctn
group by customer_id


