# Write your MySQL query statement below

# at least three times consecutively
# LAG() lets you look at previous rows without doing a self join

select distinct num as ConsecutiveNums
    from(
        select
        num, 
        LAG(num, 1) over (order by (id)) as prev1,
        LAG(num, 2) over (order by (id)) as prev2
        from logs
    ) t
where num = prev1 and num = prev2