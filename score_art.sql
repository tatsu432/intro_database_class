/*create score table*/
CREATE TABLE MD02
SELECT Code, Prefecture, CASE 
        WHEN ranking >= 0 AND ranking <= 2 THEN 10
        WHEN ranking > 2 AND ranking <= 7 THEN 9
        WHEN ranking > 7 AND ranking <= 12 THEN 8
        WHEN ranking > 12 AND ranking <= 16 THEN 7
        WHEN ranking > 16 AND ranking <= 21 THEN 6
        WHEN ranking > 21 AND ranking <= 26 THEN 5
        WHEN ranking > 26 AND ranking <= 31 THEN 4
        WHEN ranking > 31 AND ranking <= 35 THEN 3
        WHEN ranking > 35 AND ranking <= 40 THEN 2
        WHEN ranking > 40 AND ranking <= 45 THEN 1
        WHEN ranking > 45 AND ranking <= 47 THEN 0
        ELSE NULL
        END
        AS score
FROM (
    SELECT Gender, Code, Prefecture, MD02, FIND_IN_SET(
        MD02, (
            SELECT GROUP_CONCAT(
            MD02 ORDER BY MD02 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD02;

/*create score table*/
CREATE TABLE MD15
SELECT Code, Prefecture, CASE 
        WHEN ranking >= 0 AND ranking <= 2 THEN 10
        WHEN ranking > 2 AND ranking <= 7 THEN 9
        WHEN ranking > 7 AND ranking <= 12 THEN 8
        WHEN ranking > 12 AND ranking <= 16 THEN 7
        WHEN ranking > 16 AND ranking <= 21 THEN 6
        WHEN ranking > 21 AND ranking <= 26 THEN 5
        WHEN ranking > 26 AND ranking <= 31 THEN 4
        WHEN ranking > 31 AND ranking <= 35 THEN 3
        WHEN ranking > 35 AND ranking <= 40 THEN 2
        WHEN ranking > 40 AND ranking <= 45 THEN 1
        WHEN ranking > 45 AND ranking <= 47 THEN 0
        ELSE NULL
        END
        AS score
FROM (
    SELECT Gender, Code, Prefecture, MD15, FIND_IN_SET(
        MD15, (
            SELECT GROUP_CONCAT(
            MD15 ORDER BY MD15 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD15;

/*create score table*/
CREATE TABLE MD23
SELECT Code, Prefecture, CASE 
        WHEN ranking >= 0 AND ranking <= 2 THEN 10
        WHEN ranking > 2 AND ranking <= 7 THEN 9
        WHEN ranking > 7 AND ranking <= 12 THEN 8
        WHEN ranking > 12 AND ranking <= 16 THEN 7
        WHEN ranking > 16 AND ranking <= 21 THEN 6
        WHEN ranking > 21 AND ranking <= 26 THEN 5
        WHEN ranking > 26 AND ranking <= 31 THEN 4
        WHEN ranking > 31 AND ranking <= 35 THEN 3
        WHEN ranking > 35 AND ranking <= 40 THEN 2
        WHEN ranking > 40 AND ranking <= 45 THEN 1
        WHEN ranking > 45 AND ranking <= 47 THEN 0
        ELSE NULL
        END
        AS score
FROM (
    SELECT Gender, Code, Prefecture, MD23, FIND_IN_SET(
        MD23, (
            SELECT GROUP_CONCAT(
            MD23 ORDER BY MD23 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD23;

/*create score table*/
CREATE TABLE MD24
SELECT Code, Prefecture, CASE 
        WHEN ranking >= 0 AND ranking <= 2 THEN 10
        WHEN ranking > 2 AND ranking <= 7 THEN 9
        WHEN ranking > 7 AND ranking <= 12 THEN 8
        WHEN ranking > 12 AND ranking <= 16 THEN 7
        WHEN ranking > 16 AND ranking <= 21 THEN 6
        WHEN ranking > 21 AND ranking <= 26 THEN 5
        WHEN ranking > 26 AND ranking <= 31 THEN 4
        WHEN ranking > 31 AND ranking <= 35 THEN 3
        WHEN ranking > 35 AND ranking <= 40 THEN 2
        WHEN ranking > 40 AND ranking <= 45 THEN 1
        WHEN ranking > 45 AND ranking <= 47 THEN 0
        ELSE NULL
        END
        AS score
FROM (
    SELECT Gender, Code, Prefecture, MD24, FIND_IN_SET(
        MD24, (
            SELECT GROUP_CONCAT(
            MD24 ORDER BY MD24 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD24;

/*create aggregate score_art table*/
CREATE TABLE score_art
SELECT MD02.Code AS Code, MD02.Prefecture AS Prefecture, MD02.score + MD15.score + MD23.score + MD24.score AS score_art
FROM MD02
    INNER JOIN MD15
        ON MD02.Code = MD15.Code
    INNER JOIN MD23 
        ON MD02.Code = MD23.Code
    INNER JOIN MD24
        ON MD02.Code = MD24.Code
ORDER BY score_art DESC;

/*check the table*/
SELECT * FROM score_art;