# Write your MySQL query statement below

# find the percentage of the users registered in each contest

# group by contest_id, count(total number of user), 
# count(number of user registered in each contest)

-- with cnt as(
    -- select r.contest_id, 
    --     count(r.user_id) as cnt
    -- from users u        
    -- left join register r on u.user_id = r.user_id
    -- group by r.contest_id
-- )

-- select contest_id, round(cnt/count(user_id), 2) * 100
-- from cnt
-- group by user_id

WITH cnt AS (
    SELECT COUNT(DISTINCT user_id) AS cnt
    FROM users
)

SELECT 
    r.contest_id, 
    round(COUNT(r.user_id) / (SELECT cnt FROM cnt) * 100, 2) AS percentage
FROM register r
GROUP BY r.contest_id
order by percentage desc, contest_id asc;