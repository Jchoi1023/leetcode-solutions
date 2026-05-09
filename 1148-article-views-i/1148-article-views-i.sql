# Write your MySQL query statement below
# filter author_id = viewer_id 
# count >= 1

WITH cnt as (
    select 
    author_id as id,
    count(author_id) as cnt
    from views
    where author_id = viewer_id
    group by author_id, viewer_id
)

select 
    id
from cnt
where cnt >= 1
order by id asc;