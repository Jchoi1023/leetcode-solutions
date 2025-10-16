# Write your MySQL query statement below
select * from users
where REGEXP_LIKE(mail, '^[A-Za-z][a-zA-Z0-9_.-]*@leetcode\\.com$', 'c');
