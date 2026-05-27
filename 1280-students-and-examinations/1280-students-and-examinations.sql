# Write your MySQL query statement below

# number of times each student attended each exam
# return the result table ordered by student_id and subject_name

select s.student_id, s.student_name, sub.subject_name, count(ex.subject_name) as attended_exams
from students s
cross join subjects sub
left join examinations ex on s.student_id = ex.student_id
and ex.subject_name = sub.subject_name
group by sub.subject_name, s.student_id
order by s.student_id asc, sub.subject_name asc