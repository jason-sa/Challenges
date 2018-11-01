# Answers to SQL Challenge Part 4

I answered all questions below by first transforming the 8 tables specific to gender and tournament into one master table called, `tournaments_2013`. The schema of the table is below and the full SQL script is [here](create_tennis.sql). 

I added `match_id` to each of the 8 tables to uniquely identify each match. I then added `tournament` and `gender` when I built the combined table.

``` sql
CREATE TABLE  tournaments_2013 (
      tournament VARCHAR(50),
      gender VARCHAR(1),
      match_ID INT,
      player VARCHAR(255),
      round INT,
      result INT,
      fnl DOUBLE PRECISION,
      fsp DOUBLE PRECISION,
      fsw DOUBLE PRECISION,
      ssp DOUBLE PRECISION,
      ssw DOUBLE PRECISION,
      ace INT,
      dbf INT,
      wnr INT,
      ufe INT,
      bpc INT,
      bpw INT,
      npa INT,
      npw INT,
      tpw INT,
      st1 INT,
      st2 INT,
      st3 INT,
      st4 INT,
      st5 INT);

```

## Question 1

**Original question:**
>1. Using the same tennis data, find the number of matches played by
   each player in each tournament. (Remember that a player can be
   present as both player1 or player2).

**Solution**

``` sql
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
```

## Question 2

**Original question:**
>2. Who has played the most matches total in all of US Open, AUST Open, 
   French Open? Answer this both for men and women.

**Solution**

``` sql
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
```

## Question 3

**Original question:**
>3. Who has the highest first serve percentage? (Just the maximum value
   in a single match.)

**Solution**

``` sql
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
```

## Question 4

**Original question:**
>4. What are the unforced error percentages of the top three players
   with the most wins? (Unforced error percentage is % of points lost
   due to unforced errors. In a match, you have fields for number of
   points won by each player, and number of unforced errors for each
   field.)

**Solution**

``` sql
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
```