SELECT matchid, player FROM goal
WHERE teamid = 'GER';

SELECT id,stadium,team1,team2 FROM game
WHERE id = 1012;

SELECT player, teamid, stadium, mdate FROM game
JOIN goal ON id=matchid AND teamid = 'GER';

SELECT t1.id team1, t2.id team2, player FROM game g
JOIN eteam t1 ON t1.id = g.team1
JOIN eteam t2 ON t2.id = g.team2
JOIN goal go ON g.id=go.matchid
AND go.player LIKE 'Mario%';

SELECT player, teamid, t.coach, gtime FROM goal g
JOIN eteam t ON teamid = id WHERE gtime <= 10;

SELECT mdate, t.teamname FROM game g
JOIN eteam t ON t.id = g.team1
AND t.coach = 'Fernando Santos';

SELECT player FROM game g
JOIN goal go ON go.matchid = g.id
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT player FROM game
JOIN goal ON matchid = id
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid <> 'GER';

SELECT et.teamname, COUNT(go.matchid) as goals FROM goal go
INNER JOIN eteam et ON go.teamid = et.id
GROUP BY et.teamname;

SELECT ga.stadium, COUNT(go.matchid) as goals FROM game ga
INNER JOIN goal go ON go.matchid = ga.id
GROUP BY ga.stadium;

SELECT go.matchid, ga.mdate, COUNT(go.matchid) as goals FROM game ga
INNER JOIN goal go ON go.matchid = ga.id
WHERE (ga.team1 = 'POL' OR ga.team2 = 'POL')
GROUP BY go.matchid, ga.mdate;

SELECT go.matchid, ga.mdate, COUNT(go.matchid) as goals FROM game ga
INNER JOIN goal go ON go.matchid = ga.id
WHERE go.teamid = 'GER'
GROUP BY go.matchid, ga.mdate;

SELECT ga.mdate
       , ga.team1
       , SUM(CASE WHEN go.teamid = ga.team1 THEN 1 ELSE 0 END) as score1
       , ga.team2
       , SUM(CASE WHEN go.teamid = ga.team2 THEN 1 ELSE 0 END) as score2
FROM game ga
   LEFT JOIN goal go ON go.matchid = ga.id
GROUP BY ga.mdate, ga.team1, ga.team2
ORDER BY ga.mdate ASC, go.matchid ASC, ga.team1 ASC, ga.team2 ASC;
