\connect tennis;

SELECT
	player,
	MAX(fsp) AS first_serve_percentage
FROM
	tournaments_2013
GROUP BY
	player
ORDER BY 
	first_serve_percentage DESC
LIMIT 1;
