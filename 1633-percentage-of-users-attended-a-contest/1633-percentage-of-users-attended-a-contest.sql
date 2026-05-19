# Write your MySQL query statement below

# count all users / sum number of contest for user registered


select contest_id,
round(count(user_id)/(select count(user_id) from users)*100,2) as percentage
from register 
group by contest_id
order by percentage desc, contest_id asc