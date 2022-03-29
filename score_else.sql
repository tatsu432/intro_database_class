/*create score table*/
CREATE TABLE MD16
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
    SELECT Gender, Code, Prefecture, MD16, FIND_IN_SET(
        MD16, (
            SELECT GROUP_CONCAT(
            MD16 ORDER BY MD16 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD16;

/*create score table*/
CREATE TABLE MD17
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
    SELECT Gender, Code, Prefecture, MD17, FIND_IN_SET(
        MD17, (
            SELECT GROUP_CONCAT(
            MD17 ORDER BY MD17 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD17;

/*create score table*/
CREATE TABLE MD25
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
    SELECT Gender, Code, Prefecture, MD25, FIND_IN_SET(
        MD25, (
            SELECT GROUP_CONCAT(
            MD25 ORDER BY MD25 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD25;

/*create aggregate score_else table*/
CREATE TABLE score_else
SELECT MD16.Code AS Code, MD16.Prefecture AS Prefecture, MD16.score + MD17.score + MD25.score AS score_else
FROM MD16 
    INNER JOIN MD17 
        ON MD16.Code = MD17.Code
    INNER JOIN MD25 
        ON MD16.Code = MD25.Code
ORDER BY score_else DESC;

/*check the table*/
SELECT * FROM score_else;