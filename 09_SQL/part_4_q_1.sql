\connect tennis;

SELECT
	player,
	tournament,
	COUNT(1) AS matches_played
FROM
	tournaments_2013
GROUP BY
	player,
	tournament
ORDER BY
	matches_played DESC;
