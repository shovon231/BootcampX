SELECT students.name AS student,AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignments.id=assignment_submissions.assignment_id
WHERE end_date IS null
GROUP BY students.name
HAVING AVG(assignment_submissions.duration)<AVG(assignments.duration)
ORDER BY average_assignment_duration ASC;