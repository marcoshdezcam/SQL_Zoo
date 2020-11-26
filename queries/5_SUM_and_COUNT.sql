SELECT SUM(population) FROM world;

SELECT DISTINCT continent FROM world;

SELECT SUM(gdp) FROM world
WHERE continent = 'Africa';

SELECT COUNT(name) as Countries FROM world
WHERE area >= 1000000;

SELECT SUM(population) as population FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');


SELECT continent, COUNT(name) as countries FROM world
GROUP BY continent;

SELECT continent, COUNT(name) as countries FROM world
WHERE population >= 10000000 GROUP BY continent;

SELECT continent FROM world
GROUP BY continent HAVING SUM(population) >= 100000000;
