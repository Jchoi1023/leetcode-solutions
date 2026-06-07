# Write your MySQL query statement below
# need to show 0 if there is no count.

select "Low Salary" as category,
sum(CASE WHEN income < 20000 THEN 1 ELSE 0 END) as accounts_count
from accounts

UNION 

select "Average Salary" as category,
sum(CASE WHEN income >= 20000 and income <= 50000 THEN 1 ELSE 0 END) as accounts_count
from accounts

UNION 

select "High Salary" as category,
sum(CASE WHEN income > 50000 THEN 1 ELSE 0 END) as accounts_count
from accounts