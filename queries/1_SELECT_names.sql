SELECT name FROM world
  WHERE name LIKE 'Y%';

SELECT name FROM world
  WHERE name LIKE '%Y';

SELECT name FROM world
  WHERE name LIKE '%X%';

SELECT name FROM world
  WHERE name LIKE '%LAND';

SELECT name FROM world
  WHERE name LIKE 'C%IA';

SELECT name FROM world
  WHERE name LIKE '%oo%';

SELECT name FROM world
  WHERE name LIKE '%oo%';

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

SELECT name FROM world
 WHERE name LIKE '%o__o%';

SELECT name FROM world
 WHERE name LIKE '%o__o%';

SELECT name FROM world
 WHERE name LIKE '____'

SELECT name
  FROM world
 WHERE name LIKE capital;

SELECT name
  FROM world
 WHERE capital LIKE concat(name, ' City');

SELECT capital, name
  FROM world
 WHERE capital LIKE '%' || name || '%';

SELECT capital, name
FROM world
WHERE capital LIKE name || '_%'
