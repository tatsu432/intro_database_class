/*create male only table*/
CREATE TABLE artscore_male
SELECT * FROM jlife WHERE Gender = 'Male' AND Code <> 'R00000';


/*DROP particular ranking table*/
DROP TABLE MD02, MD03, MD04, MD05, MD06, MD07, MD08, MD09, MD10, MD11, MD13, MD14, MD15, MD16, MD17, MD23, MD24, MD25, MD26, MD27;

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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
) AS art;

SELECT * FROM MD24;

/*create aggregate score_art_male table*/
CREATE TABLE score_art_male
SELECT MD02.Code AS Code, MD02.Prefecture AS Prefecture, MD02.score + MD15.score + MD23.score + MD24.score AS score_art_male
FROM MD02
    INNER JOIN MD15
        ON MD02.Code = MD15.Code
    INNER JOIN MD23 
        ON MD02.Code = MD23.Code
    INNER JOIN MD24
        ON MD02.Code = MD24.Code
ORDER BY score_art_male DESC;

/*check the table*/
SELECT * FROM score_art_male;








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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
) AS art;

SELECT * FROM MD27;

/*create aggregate literature score table*/
CREATE TABLE score_literature_male
SELECT MD26.Code AS Code, MD26.Prefecture AS Prefecture, MD26.score + MD27.score AS score_literature_male
FROM MD26 INNER JOIN MD27 ON MD26.Code = MD27.Code
ORDER BY score_literature_male DESC;

/*check the table*/
SELECT * FROM score_literature_male;









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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
) AS art;

SELECT * FROM MD11;

/*create aggregate score_music_male table*/
CREATE TABLE score_music_male
SELECT MD06.Code AS Code, MD06.Prefecture AS Prefecture, MD06.score + MD07.score + MD08.score + MD09.score + MD10.score + MD11.score AS score_music_male
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
ORDER BY score_music_male DESC;

/*check the table*/
SELECT * FROM score_music_male;










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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
) AS art;

SELECT * FROM MD14;

/*create aggregate score_theater_male table*/
CREATE TABLE score_theater_male
SELECT MD03.Code AS Code, MD03.Prefecture AS Prefecture, MD03.score + MD04.score + MD05.score + MD13.score + MD14.score AS score_theater_male
FROM MD03
    INNER JOIN MD04
        ON MD03.Code = MD04.Code
    INNER JOIN MD05 
        ON MD03.Code = MD05.Code
    INNER JOIN MD13
        ON MD03.Code = MD13.Code
    INNER JOIN MD14
        ON MD03.Code = MD14.Code
ORDER BY score_theater_male DESC;

/*check the table*/
SELECT * FROM score_theater_male;







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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
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
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
) AS art;

SELECT * FROM MD25;

/*create aggregate score_else_male table*/
CREATE TABLE score_else_male
SELECT MD16.Code AS Code, MD16.Prefecture AS Prefecture, MD16.score + MD17.score + MD25.score AS score_else_male
FROM MD16 
    INNER JOIN MD17 
        ON MD16.Code = MD17.Code
    INNER JOIN MD25 
        ON MD16.Code = MD25.Code
ORDER BY score_else_male DESC;

/*check the table*/
SELECT * FROM score_else_male;










/*create aggregate score_music_male table*/
CREATE TABLE score_all_art_male
SELECT score_art_male.Code AS Code, score_art_male.Prefecture AS Prefecture, score_art_male.score_art_male + score_literature_male.score_literature_male + score_music_male.score_music_male + score_theater_male.score_theater_male + score_else_male.score_else_male AS score_all_art_male
FROM score_art_male
    INNER JOIN score_literature_male
        ON score_art_male.Code = score_literature_male.Code
    INNER JOIN score_music_male
        ON score_art_male.Code = score_music_male.Code
    INNER JOIN score_theater_male
        ON score_art_male.Code = score_theater_male.Code
    INNER JOIN score_else_male
        ON score_art_male.Code = score_else_male.Code
ORDER BY score_all_art_male DESC;

/*check the table*/
SELECT * FROM score_all_art_male;