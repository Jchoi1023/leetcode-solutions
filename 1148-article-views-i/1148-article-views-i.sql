# Write your MySQL query statement below
-- all the authors that viewed at least one of their articles.
-- sorting id asc

-- author_id == viewer_id 
-- count(article_id) >= 1

-- we cannot use aggregate function with where, because filters rows happens before 
-- aggregate function so I create WITH 

WITH cnt as (
    select 
        distinct author_id as id, 
        author_id, 
        viewer_id,
        count(author_id) as count_article
    from views
    where author_id = viewer_id
    group by author_id, viewer_id
)

select 
id
from cnt
where count_article >= 1
order by id asc;



