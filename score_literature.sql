/*create score table*/
CREATE TABLE MD26
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
    SELECT Gender, Code, Prefecture, MD26, FIND_IN_SET(
        MD26, (
            SELECT GROUP_CONCAT(
            MD26 ORDER BY MD26 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD26;

/*create score table*/
CREATE TABLE MD27
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
    SELECT Gender, Code, Prefecture, MD27, FIND_IN_SET(
        MD27, (
            SELECT GROUP_CONCAT(
            MD27 ORDER BY MD27 DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

SELECT * FROM MD27;

/*create aggregate literature score table*/
CREATE TABLE score_literature
SELECT MD26.Code AS Code, MD26.Prefecture AS Prefecture, MD26.score + MD27.score AS score_literature
FROM MD26 INNER JOIN MD27 ON MD26.Code = MD27.Code
ORDER BY score_literature DESC;

/*check the table*/
SELECT * FROM score_literature;