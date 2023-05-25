SELECT DISTINCT teachers.name AS teacher,cohorts.name AS cohort, COUNT(assistance_requests.completed_at)
FROM cohorts
JOIN students ON cohorts.id=students.cohort_id
JOIN assistance_requests ON assistance_requests.student_id=students.id
JOIN teachers ON teachers.id=assistance_requests.teacher_id
WHERE cohorts.name='JUL02'
GROUP BY teachers.name,cohorts.name
ORDER BY teacher;