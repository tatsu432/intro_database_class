/*create score table*/
CREATE TABLE MD06
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
    SELECT Gender, Code, Prefecture, MD06, FIND_IN_SET(
        MD06, (
            SELECT GROUP_CONCAT(
            MD06 ORDER BY MD06 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD06;

/*create score table*/
CREATE TABLE MD07
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
    SELECT Gender, Code, Prefecture, MD07, FIND_IN_SET(
        MD07, (
            SELECT GROUP_CONCAT(
            MD07 ORDER BY MD07 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD07;

/*create score table*/
CREATE TABLE MD08
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
    SELECT Gender, Code, Prefecture, MD08, FIND_IN_SET(
        MD08, (
            SELECT GROUP_CONCAT(
            MD08 ORDER BY MD08 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD08;

/*create score table*/
CREATE TABLE MD09
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
    SELECT Gender, Code, Prefecture, MD09, FIND_IN_SET(
        MD09, (
            SELECT GROUP_CONCAT(
            MD09 ORDER BY MD09 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD09;

/*create score table*/
CREATE TABLE MD10
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
    SELECT Gender, Code, Prefecture, MD10, FIND_IN_SET(
        MD10, (
            SELECT GROUP_CONCAT(
            MD10 ORDER BY MD10 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD10;

/*create score table*/
CREATE TABLE MD11
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
    SELECT Gender, Code, Prefecture, MD11, FIND_IN_SET(
        MD11, (
            SELECT GROUP_CONCAT(
            MD11 ORDER BY MD11 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD11;

/*create aggregate score_music table*/
CREATE TABLE score_music
SELECT MD06.Code AS Code, MD06.Prefecture AS Prefecture, MD06.score + MD07.score + MD08.score + MD09.score + MD10.score + MD11.score AS score_music
FROM MD06
    INNER JOIN MD07
        ON MD06.Code = MD07.Code
    INNER JOIN MD08
        ON MD06.Code = MD08.Code
    INNER JOIN MD09
        ON MD06.Code = MD09.Code
    INNER JOIN MD10
        ON MD06.Code = MD10.Code
    INNER JOIN MD11
        ON MD06.Code = MD11.Code
ORDER BY score_music DESC;

/*check the table*/
SELECT * FROM score_music;