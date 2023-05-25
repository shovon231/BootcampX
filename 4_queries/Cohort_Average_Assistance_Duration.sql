SELECT AVG(total_duration) AS average_total_duration from (SELECT cohorts.name AS name, SUM(assistance_requests.completed_at-assistance_requests.started_at) AS total_duration 
FROM assistance_requests
JOIN students ON students.id=student_id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name) a
limit 1;

