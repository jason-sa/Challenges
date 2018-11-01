\connect tennis;

WITH top_3_players AS (
SELECT
	player,
	COUNT(1) AS num_wins
FROM
	tournaments_2013
WHERE
	result = 1
GROUP BY
	player
ORDER BY
	num_wins DESC
LIMIT 3
)

SELECT
	t.player,
	SUM(TPW) AS total_points_won,
	SUM(COALESCE(UFE, 0)) AS unforced_errors,
	SUM(COALESCE(UFE, 0))::numeric / SUM(TPW)::numeric AS unforced_error_percentage
FROM
		tournaments_2013 AS t
INNER JOIN	top_3_players as p
	ON t.player = p.player
WHERE
	TPW IS NOT NULL
GROUP BY
	t.player;
