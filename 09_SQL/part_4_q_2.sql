\connect tennis

SELECT
	'Men' AS gender,
	player,
	COUNT(1) AS matches_played
FROM 
	tournaments_2013
WHERE
	gender = 'M'
GROUP BY
	player
ORDER BY
	matches_played DESC
LIMIT 1;

SELECT
	'Women' AS gender,
	player,
	COUNT(1) AS matches_played
FROM 
	tournaments_2013
WHERE
	gender = 'F'
GROUP BY
	player
ORDER BY
	matches_played DESC
LIMIT 1;
