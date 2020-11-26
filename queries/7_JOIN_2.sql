SELECT id, title FROM movie
 WHERE yr = 1962;

SELECT yr FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%' ORDER BY yr;

SELECT id FROM actor
WHERE name = 'Glenn Close';

SELECT id FROM movie
WHERE title = 'Casablanca';

SELECT a.name FROM casting c
JOIN actor a ON a.id = c.actorid
WHERE movieid = 11768;

SELECT name FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE title = 'Alien';

SELECT m.title FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford';

SELECT m.title FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford'
AND c.ord <> 1;

SELECT m.title, a.name FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE m.yr = 1962 AND c.ord = 1;

SELECT yr, COUNT(title) FROM movie JOIN casting ON movie.id = movieid
JOIN actor   ON actorid  = actor.id
WHERE name='Rock Hudson' GROUP BY yr HAVING COUNT(title) > 2;

SELECT DISTINCT mo.title, ac2.name FROM casting ca1
   INNER JOIN movie mo ON mo.id = ca1.movieid
   INNER JOIN actor ac1 ON ac1.id = ca1.actorid
   INNER JOIN casting ca2 ON mo.id = ca2.movieid
   INNER JOIN actor ac2 ON ac2.id = ca2.actorid
WHERE ac1.id IN (SELECT ac3.id FROM actor ac3 WHERE ac3.name='Julie Andrews')
      AND ca2.ord = 1;


SELECT ac.name FROM actor ac
   INNER JOIN casting ca ON ca.actorid = ac.id
WHERE ca.ord = 1 GROUP BY ac.name
HAVING COUNT(ca.movieid) >= 15 ORDER BY ac.name ASC;

SELECT mo.title, COUNT(ca.movieid) as actors FROM casting ca
   INNER JOIN movie mo ON ca.movieid = mo.id
WHERE mo.yr = 1978 GROUP BY mo.title ORDER BY 2 DESC, 1 ASC;

SELECT DISTINCT ac1.name FROM casting ca1
   INNER JOIN actor ac1 ON ca1.actorid = ac1.id
WHERE ca1.movieid IN
          (SELECT ca2.movieid
           FROM casting ca2
              INNER JOIN actor ac2 ON ca2.actorid = ac2.id
           WHERE ac2.name = 'Art Garfunkel')
      AND ac1.name <> 'Art Garfunkel';
