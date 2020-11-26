SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC;

SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party;

SELECT yr, party, votes,
       RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party, yr;

SELECT constituency, party, votes,
       RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
      AND yr  = 2017
ORDER BY posn ASC, constituency ASC;

SELECT t.constituency, t.party
FROM
 (
   SELECT g.constituency, g.party,
          RANK() OVER (PARTITION BY g.constituency ORDER BY g.votes DESC) as posn
   FROM ge g
   WHERE g.constituency BETWEEN 'S14000021' AND 'S14000026'
         AND g.yr  = 2017
 ) as t
WHERE t.posn = 1;

SELECT t.party, COUNT(t.constituency) as seats
FROM
 (
   SELECT g.constituency, g.party,
          RANK() OVER (PARTITION BY g.constituency ORDER BY g.votes DESC) as posn
   FROM ge g
   WHERE g.constituency LIKE 'S%' AND g.yr  = 2017
 ) as t
WHERE t.posn = 1
GROUP BY t.party;
