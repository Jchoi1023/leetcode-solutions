# Write your MySQL query statement below
select st.student_id, 
    st.student_name, 
    sub.subject_name, 
    COUNT(e.subject_name) AS attended_exams
    from students st
    cross join subjects sub
    left join examinations e on st.student_id = e.student_id
        AND sub.subject_name = e.subject_name 
    group by st.student_id, 
    st.student_name, 
    sub.subject_name
    ORDER BY st.student_id, sub.subject_name;



