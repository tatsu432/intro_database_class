/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS make_score_male//

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_score_male(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT(col, 'm');
SET @query = CONCAT('CREATE TABLE ', @test2, ' 
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
    SELECT Gender, Code, Prefecture, ', @test, ', FIND_IN_SET(
        ', @test, ', (
            SELECT GROUP_CONCAT(
            ', @test, ' ORDER BY ', @test, ' DESC
            )
            FROM artscore_male
        )
        ) AS ranking
        FROM artscore_male
) AS art
ORDER BY score DESC;');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  




/*create score table*/
CALL make_score_male('MD02');
CALL make_score_male('MD15');
CALL make_score_male('MD23');
CALL make_score_male('MD24');

/*create aggregate score_art_male table*/
CREATE TABLE score_art_male
SELECT MD02m.Code AS Code, MD02m.Prefecture AS Prefecture, MD02m.score + MD15m.score + MD23m.score + MD24m.score AS score_art_male
FROM MD02m
    INNER JOIN MD15m
        ON MD02m.Code = MD15m.Code
    INNER JOIN MD23m
        ON MD02m.Code = MD23m.Code
    INNER JOIN MD24m
        ON MD02m.Code = MD24m.Code
ORDER BY score_art_male DESC;

/*check the table*/
SELECT * FROM score_art_male;




/*create score table*/
CALL make_score_male('MD26');
CALL make_score_male('MD27');


/*create aggregate literature score table*/
CREATE TABLE score_literature_male
SELECT MD26m.Code AS Code, MD26m.Prefecture AS Prefecture, MD26m.score + MD27m.score AS score_literature_male
FROM MD26m INNER JOIN MD27m ON MD26m.Code = MD27m.Code
ORDER BY score_literature_male DESC;

/*check the table*/
SELECT * FROM score_literature_male;





/*create score table*/
CALL make_score_male('MD06');
CALL make_score_male('MD07');
CALL make_score_male('MD08');
CALL make_score_male('MD09');
CALL make_score_male('MD10');
CALL make_score_male('MD11');

/*create aggregate score_music_male table*/
CREATE TABLE score_music_male
SELECT MD06m.Code AS Code, MD06m.Prefecture AS Prefecture, MD06m.score + MD07m.score + MD08m.score + MD09m.score + MD10m.score + MD11m.score AS score_music_male
FROM MD06m
    INNER JOIN MD07m
        ON MD06m.Code = MD07m.Code
    INNER JOIN MD08m
        ON MD06m.Code = MD08m.Code
    INNER JOIN MD09m
        ON MD06m.Code = MD09m.Code
    INNER JOIN MD10m
        ON MD06m.Code = MD10m.Code
    INNER JOIN MD11m
        ON MD06m.Code = MD11m.Code
ORDER BY score_music_male DESC;

/*check the table*/
SELECT * FROM score_music_male;




/*create score table*/
CALL make_score_male('MD03');
CALL make_score_male('MD04');
CALL make_score_male('MD05');
CALL make_score_male('MD13');
CALL make_score_male('MD14');

/*create aggregate score_theater_male table*/
CREATE TABLE score_theater_male
SELECT MD03m.Code AS Code, MD03m.Prefecture AS Prefecture, MD03m.score + MD04m.score + MD05m.score + MD13m.score + MD14m.score AS score_theater_male
FROM MD03m
    INNER JOIN MD04m
        ON MD03m.Code = MD04m.Code
    INNER JOIN MD05m
        ON MD03m.Code = MD05m.Code
    INNER JOIN MD13m
        ON MD03m.Code = MD13m.Code
    INNER JOIN MD14m 
        ON MD03m.Code = MD14m.Code
ORDER BY score_theater_male DESC;

/*check the table*/
SELECT * FROM score_theater_male;


/*create score table*/
CALL make_score_male('MD16');
CALL make_score_male('MD17');
CALL make_score_male('MD25');

/*create aggregate score_else_male table*/
CREATE TABLE score_else_male
SELECT MD16m.Code AS Code, MD16m.Prefecture AS Prefecture, MD16m.score + MD17m.score + MD25m.score AS score_else_male
FROM MD16m
    INNER JOIN MD17m
        ON MD16m.Code = MD17m.Code
    INNER JOIN MD25m
        ON MD16m.Code = MD25m.Code
ORDER BY score_else_male DESC;

/*check the table*/
SELECT * FROM score_else_male;










/*create aggregate score_all_art_male table*/
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