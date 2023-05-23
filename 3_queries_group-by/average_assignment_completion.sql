SELECT students.name AS student, avg(assignment_submissions.duration) average_assignment_duration
FROM students 
JOIN assignment_submissions ON students.id=assignment_submissions.student_id GROUP BY student, students.end_date
HAVING students.end_date IS null
ORDER BY average_assignment_duration DESC;

