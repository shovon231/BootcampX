const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const queryString = `SELECT DISTINCT teachers.name AS teacher,cohorts.name AS cohort, COUNT(assistance_requests.completed_at)
FROM cohorts
JOIN students ON cohorts.id=students.cohort_id
JOIN assistance_requests ON assistance_requests.student_id=students.id
JOIN teachers ON teachers.id=assistance_requests.teacher_id
WHERE cohorts.name LIKE $1
GROUP BY teachers.name,cohorts.name
ORDER BY teacher
LIMIT $2;`;
const values = [`%${cohortName}%`, limit];
pool
  .query(queryString, values)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(`${user.cohort}: ${user.teacher}`);
    });
  })
  .catch((err) => console.error("query error", err.stack));
