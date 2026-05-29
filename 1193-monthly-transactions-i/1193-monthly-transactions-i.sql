# Write your MySQL query statement below

# for each month and country -> grouping by month and country
# trans total amount, approved total amount

select 
    date_format(trans_date, "%Y-%m") as month, 
    country,
    count(id) as trans_count,
    sum(CASE WHEN state = 'approved' then 1 else 0 end) as approved_count,
    sum(amount) as trans_total_amount,
    sum(CASE WHEN state = 'approved' then amount else 0 end) as approved_total_amount
from transactions
group by country, month