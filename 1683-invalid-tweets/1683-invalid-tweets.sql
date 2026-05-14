# Write your MySQL query statement below

# count characters in content
# remove space

select
    tweet_id
from tweets
where length(replace(content, ' ', '')) > 15