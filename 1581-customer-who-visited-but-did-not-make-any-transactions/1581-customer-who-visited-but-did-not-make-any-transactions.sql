# Write your MySQL query statement below

# if they visited twice a day, then they had a different id?
# no transactions and how many times did they do?
# no tran_id means no visited_id?
# visit_id has a value if customer doesn't have any transaction?

    select
        v.customer_id,
        count(v.customer_id) as count_no_trans
    from visits v
    left join transactions t on v.visit_id = t.visit_id
    where t.transaction_id IS NULL
    group by v.customer_id









