SELECT COUNT(id) as stops FROM stops;

SELECT id FROM stops
WHERE name = 'Craiglockhart';

SELECT s.id, s.name FROM route r
JOIN stops s on s.id = r.stop
WHERE num = '4'AND company = 'LRT';

SELECT company, num, COUNT(*) FROM route WHERE stop=149 OR stop=53
GROUP BY company, num HAVING COUNT(*) = 2;


SELECT a.company, a.num, a.stop, b.stop FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
WHERE a.stop = 53 AND b.stop = 149;

SELECT ra.company, ra.num, sa.name, sb.name FROM route ra
  INNER JOIN route rb ON ra.company=rb.company AND ra.num=rb.num
  INNER JOIN stops sa ON ra.stop=sa.id
  INNER JOIN stops sb ON rb.stop=sb.id
WHERE sa.name='Craiglockhart' AND sb.name='London Road';

SELECT DISTINCT ra.company, ra.num FROM route ra
  INNER JOIN route rb ON ra.company=rb.company AND ra.num=rb.num
WHERE ra.stop = 115 AND rb.stop = 137;

SELECT DISTINCT ra.company, ra.num FROM route ra
  INNER JOIN route rb ON ra.company=rb.company AND ra.num=rb.num
  INNER JOIN stops sa ON sa.id = ra.stop
  INNER JOIN stops sb ON sb.id = rb.stop
WHERE sa.name = 'Craiglockhart' AND sb.name = 'Tollcross';


SELECT sb.name, ra.company, ra.num FROM route ra
  INNER JOIN route rb ON ra.company=rb.company AND ra.num=rb.num
  INNER JOIN stops sa ON sa.id = ra.stop
  INNER JOIN stops sb ON sb.id = rb.stop
WHERE sa.name = 'Craiglockhart' AND ra.company = 'LRT';

SELECT ra.num, ra.company, sb.name, rb2.num, rb2.company FROM stops sa
  INNER JOIN route ra ON sa.id = ra.stop
  INNER JOIN route rb1 ON ra.company=rb1.company AND ra.num=rb1.num
  INNER JOIN route rb2 ON rb1.stop = rb2.stop
  INNER JOIN stops sb ON sb.id = rb2.stop
  INNER JOIN route rc ON rb2.company=rc.company AND rb2.num=rc.num
  INNER JOIN stops sc ON sc.id = rc.stop
WHERE sa.name = 'Craiglockhart' AND sc.name = 'Lochend'
GROUP BY ra.num, ra.company, sb.name, rb2.num, rb2.company;
