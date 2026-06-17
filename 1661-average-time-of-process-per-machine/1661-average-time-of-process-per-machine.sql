# Write your MySQL query statement below

# Let me make sure I understand the problem correctly.
# Each process has exactly one start record and one end record so that I can calcuate the average?
# Since the start and end timestamps are stored separate rows, so I do join them to bring into the same row.
# Alias 
select a1.machine_id as machine_id,round(avg(a2.timestamp - a1.timestamp), 3) as processing_time
from activity a1
join activity a2 on a1.machine_id = a2.machine_id
and a1.process_id = a2.process_id 
# with this self join, it would also match start records with other start records and end records with other end records because I'm only using joining on machine_id and process_id.
where a1.activity_type = 'start' and a2.activity_type = 'end'
# we need to group by since the requirement is for calculating average processing time by machine.
group by a1.machine_id