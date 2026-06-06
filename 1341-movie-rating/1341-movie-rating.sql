# Write your MySQL query statement below

# user who has rated the greatest number of movies,
# moview highest average rating in February 2020
with cte as (
select m.movie_id,
    m.title, 
    u.user_id, 
    u.name, 
    -- mr.movie_id,
    -- mr.user_id,
    mr.rating,
    mr.created_at
from movies m
left join movierating mr on mr.movie_id = m.movie_id
left join users u on u.user_id = mr.user_id
),

user_result AS (
    SELECT name AS results
    FROM cte
    GROUP BY user_id, name
    ORDER BY COUNT(*) DESC, name
    LIMIT 1
),

movie_result as (
    select title as results
    from cte
    WHERE created_at >= '2020-02-01'
    AND created_at < '2020-03-01'
    GROUP BY movie_id, title
    ORDER BY AVG(rating) DESC, title
    LIMIT 1
)

SELECT results FROM user_result
UNION ALL
SELECT results FROM movie_result;