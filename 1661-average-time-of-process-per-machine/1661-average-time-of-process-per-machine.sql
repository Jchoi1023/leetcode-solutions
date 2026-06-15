# Write your MySQL query statement below

# need to find average time. 
# end - start

with cte as (
    select a1.machine_id, a1.process_id, a1.activity_type, a1.timestamp as start, a2.timestamp as end
from activity a1
left join activity a2 on a1.machine_id = a2.machine_id 
and a1.process_id = a2.process_id
where a1.activity_type = 'start' and a2.activity_type = 'end'
)



select machine_id, round(avg(end - start),3) as processing_time
from cte
group by machine_id