/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS make_score_female//

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_score_female(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT(col, 'f');
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
            FROM artscore_female
        )
        ) AS ranking
        FROM artscore_female
) AS art
ORDER BY score DESC;');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  



/*create score table*/
CALL make_score_female('MD02');
CALL make_score_female('MD15');
CALL make_score_female('MD23');
CALL make_score_female('MD24');

/*create aggregate score_art_female table*/
CREATE TABLE score_art_female
SELECT MD02f.Code AS Code, MD02f.Prefecture AS Prefecture, MD02f.score + MD15f.score + MD23f.score + MD24f.score AS score_art_female
FROM MD02f
    INNER JOIN MD15f
        ON MD02f.Code = MD15f.Code
    INNER JOIN MD23f 
        ON MD02f.Code = MD23f.Code
    INNER JOIN MD24f
        ON MD02f.Code = MD24f.Code
ORDER BY score_art_female DESC;

/*check the table*/
SELECT * FROM score_art_female;




/*create score table*/
CALL make_score_female('MD26');
CALL make_score_female('MD27');


/*create aggregate literature score table*/
CREATE TABLE score_literature_female
SELECT MD26f.Code AS Code, MD26f.Prefecture AS Prefecture, MD26f.score + MD27f.score AS score_literature_female
FROM MD26f INNER JOIN MD27f ON MD26f.Code = MD27f.Code
ORDER BY score_literature_female DESC;

/*check the table*/
SELECT * FROM score_literature_female;





/*create score table*/
CALL make_score_female('MD06');
CALL make_score_female('MD07');
CALL make_score_female('MD08');
CALL make_score_female('MD09');
CALL make_score_female('MD10');
CALL make_score_female('MD11');

/*create aggregate score_music_female table*/
CREATE TABLE score_music_female
SELECT MD06f.Code AS Code, MD06f.Prefecture AS Prefecture, MD06f.score + MD07f.score + MD08f.score + MD09f.score + MD10f.score + MD11f.score AS score_music_female
FROM MD06f
    INNER JOIN MD07f
        ON MD06f.Code = MD07f.Code
    INNER JOIN MD08f
        ON MD06f.Code = MD08f.Code
    INNER JOIN MD09f
        ON MD06f.Code = MD09f.Code
    INNER JOIN MD10f
        ON MD06f.Code = MD10f.Code
    INNER JOIN MD11f
        ON MD06f.Code = MD11f.Code
ORDER BY score_music_female DESC;

/*check the table*/
SELECT * FROM score_music_female;




/*create score table*/
CALL make_score_female('MD03');
CALL make_score_female('MD04');
CALL make_score_female('MD05');
CALL make_score_female('MD13');
CALL make_score_female('MD14');

/*create aggregate score_theater_female table*/
CREATE TABLE score_theater_female
SELECT MD03f.Code AS Code, MD03f.Prefecture AS Prefecture, MD03f.score + MD04f.score + MD05f.score + MD13f.score + MD14f.score AS score_theater_female
FROM MD03f
    INNER JOIN MD04f
        ON MD03f.Code = MD04f.Code
    INNER JOIN MD05f
        ON MD03f.Code = MD05f.Code
    INNER JOIN MD13f
        ON MD03f.Code = MD13f.Code
    INNER JOIN MD14f
        ON MD03f.Code = MD14f.Code
ORDER BY score_theater_female DESC;

/*check the table*/
SELECT * FROM score_theater_female;


/*create score table*/
CALL make_score_female('MD16');
CALL make_score_female('MD17');
CALL make_score_female('MD25');

/*create aggregate score_else_female table*/
CREATE TABLE score_else_female
SELECT MD16f.Code AS Code, MD16f.Prefecture AS Prefecture, MD16f.score + MD17f.score + MD25f.score AS score_else_female
FROM MD16f
    INNER JOIN MD17f
        ON MD16f.Code = MD17f.Code
    INNER JOIN MD25f 
        ON MD16f.Code = MD25f.Code
ORDER BY score_else_female DESC;

/*check the table*/
SELECT * FROM score_else_female;










/*create aggregate score_all_art_female table*/
CREATE TABLE score_all_art_female
SELECT score_art_female.Code AS Code, score_art_female.Prefecture AS Prefecture, score_art_female.score_art_female + score_literature_female.score_literature_female + score_music_female.score_music_female + score_theater_female.score_theater_female + score_else_female.score_else_female AS score_all_art_female
FROM score_art_female
    INNER JOIN score_literature_female
        ON score_art_female.Code = score_literature_female.Code
    INNER JOIN score_music_female
        ON score_art_female.Code = score_music_female.Code
    INNER JOIN score_theater_female
        ON score_art_female.Code = score_theater_female.Code
    INNER JOIN score_else_female
        ON score_art_female.Code = score_else_female.Code
ORDER BY score_all_art_female DESC;

/*check the table*/
SELECT * FROM score_all_art_female;