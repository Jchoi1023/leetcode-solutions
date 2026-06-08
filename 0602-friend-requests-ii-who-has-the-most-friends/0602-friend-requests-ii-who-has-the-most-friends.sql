# Write your MySQL query statement below

# person who have the most friends and the most friends number

# count(registered_id) group by accepter_id
# count (accepter_id) group by requester_id

with cte as
(
select requester_id as id from RequestAccepted
union all
select accepter_id as id from RequestAccepted
)

SELECT id, COUNT(*) AS num
FROM cte
GROUP BY id
ORDER BY num DESC
LIMIT 1;
