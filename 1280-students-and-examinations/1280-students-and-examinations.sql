# Write your MySQL query statement below
select  st.student_id, st.student_name, sb.subject_name, count(ex.student_id) as attended_exams
from students st
cross join subjects sb #to ensure all combinations exist, including zero attendance
left join examinations ex on sb.subject_name = ex.subject_name #to keep all student-subject pairs even with no exam records
                            and st.student_id = ex.student_id
group by st.student_id, st.student_name, sb.subject_name
order by st.student_id, st.student_name asc