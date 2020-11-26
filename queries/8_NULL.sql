SELECT name FROM teacher
WHERE dept IS NULL;

SELECT teacher.name, dept.name FROM teacher
INNER JOIN dept ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

SELECT t.name, COALESCE(CASE WHEN d.name IS NULL THEN 'None' ELSE d.name END) as dept
FROM teacher t
   LEFT JOIN dept d ON (t.dept=d.id);

SELECT COUNT(t.name) as teachers, COUNT(t.mobile) as mobiles FROM teacher t;

SELECT d.name, COUNT(t.id) as staff FROM teacher t
   RIGHT JOIN dept d ON t.dept = d.id GROUP BY d.name;

SELECT t.name, CASE WHEN d.id IN (1,2) THEN 'Sci' ELSE 'Art' END as title FROM teacher t
   LEFT JOIN dept d ON t.dept = d.id;

SELECT t.name, CASE WHEN d.id IN (1,2) THEN 'Sci' WHEN d.id = 3 THEN 'Art' ELSE 'None' END as title
FROM teacher t LEFT JOIN dept d ON t.dept = d.id;
