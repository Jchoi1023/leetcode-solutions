# Write your MySQL query statement below

-- find ID
-- number of characters in the content > 15, not special characters.

-- Length, Replace

select 
    tweet_id
from tweets
where length(replace(content, ' ', '')) > 15