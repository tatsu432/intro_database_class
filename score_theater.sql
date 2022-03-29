/*create score table*/
CREATE TABLE MD03
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
    SELECT Gender, Code, Prefecture, MD03, FIND_IN_SET(
        MD03, (
            SELECT GROUP_CONCAT(
            MD03 ORDER BY MD03 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD03;

/*create score table*/
CREATE TABLE MD04
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
    SELECT Gender, Code, Prefecture, MD04, FIND_IN_SET(
        MD04, (
            SELECT GROUP_CONCAT(
            MD04 ORDER BY MD04 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD04;

/*create score table*/
CREATE TABLE MD05
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
    SELECT Gender, Code, Prefecture, MD05, FIND_IN_SET(
        MD05, (
            SELECT GROUP_CONCAT(
            MD05 ORDER BY MD05 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD05;

/*create score table*/
CREATE TABLE MD13
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
    SELECT Gender, Code, Prefecture, MD13, FIND_IN_SET(
        MD13, (
            SELECT GROUP_CONCAT(
            MD13 ORDER BY MD13 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD13;

/*create score table*/
CREATE TABLE MD14
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
    SELECT Gender, Code, Prefecture, MD14, FIND_IN_SET(
        MD14, (
            SELECT GROUP_CONCAT(
            MD14 ORDER BY MD14 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD14;

/*create aggregate score_theater table*/
CREATE TABLE score_theater
SELECT MD03.Code AS Code, MD03.Prefecture AS Prefecture, MD03.score + MD04.score + MD05.score + MD13.score + MD14.score AS score_theater
FROM MD03
    INNER JOIN MD04
        ON MD03.Code = MD04.Code
    INNER JOIN MD05 
        ON MD03.Code = MD05.Code
    INNER JOIN MD13
        ON MD03.Code = MD13.Code
    INNER JOIN MD14
        ON MD03.Code = MD14.Code
ORDER BY score_theater DESC;

/*check the table*/
SELECT * FROM score_theater;