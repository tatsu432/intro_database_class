ALTER TABLE score_art_female RENAME COLUMN score_art_female TO score;
ALTER TABLE score_literature_female RENAME COLUMN score_literature_female TO score;
ALTER TABLE score_music_female RENAME COLUMN score_music_female TO score;
ALTER TABLE score_theater_female RENAME COLUMN score_theater_female TO score;
ALTER TABLE score_else_female RENAME COLUMN score_else_female TO score;

ALTER TABLE score_art_male RENAME COLUMN score_art_male TO score;
ALTER TABLE score_literature_male RENAME COLUMN score_literature_male TO score;
ALTER TABLE score_music_male RENAME COLUMN score_music_male TO score;
ALTER TABLE score_theater_male RENAME COLUMN score_theater_male TO score;
ALTER TABLE score_else_male RENAME COLUMN score_else_male TO score;

ALTER TABLE score_art_female RENAME TO artf;
ALTER TABLE score_literature_female RENAME TO litef;
ALTER TABLE score_music_female RENAME TO musicf;
ALTER TABLE score_theater_female RENAME TO theaterf;
ALTER TABLE score_else_female RENAME TO elsef;

ALTER TABLE score_art_male RENAME TO artm;
ALTER TABLE score_literature_male RENAME TO litem;
ALTER TABLE score_music_male RENAME TO musicm;
ALTER TABLE score_theater_male RENAME TO theaterm;
ALTER TABLE score_else_male RENAME TO elsem;

/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS f_minus_m1//

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE f_minus_m1(IN col varchar(10), code varchar(10))      
BEGIN

SET @test = col;
SET @code = code;
SET @test2 = CONCAT(col, 'f');
SET @test3 = CONCAT(col, 'm');
SET @query1 = CONCAT('
/*create TEMPORARY table*/
CREATE TEMPORARY TABLE f_minus_m_', @test, '_', @code, ' 
SELECT ', @test2, '.score -  ', @test3, '.score AS f_minus_m
FROM  ', @test2, ' 
    INNER JOIN  ', @test3, ' 
    ON  ', @test2, '.Code =  ', @test3, '.Code
WHERE  ', @test2, '.Code =  ''', @code, ''';
');

PREPARE stm FROM @query1;
EXECUTE stm;

SET @query2 = CONCAT('
CREATE TEMPORARY TABLE name_', @test, '_', @code, '  (
    name varchar(10)
);
');

PREPARE stmt FROM @query2;
EXECUTE stmt;

SET @query3 = CONCAT('
INSERT INTO name_', @test, '_', @code, '   VALUES (''', col, ''' )
;
');

PREPARE stmt FROM @query3;
EXECUTE stmt;

SET @query4 = CONCAT('
CREATE TEMPORARY TABLE f_minus_m2_', @test, '_', @code, '  
SELECT * 
FROM name_', @test, '_', @code, '  , f_minus_m_', @test, '_', @code, ' ;
');

PREPARE stmt FROM @query4;
EXECUTE stmt;

SET @query5 = CONCAT('
INSERT INTO f_minus_m_all_by5_', @code, '  (name, f_minus_m)
SELECT * FROM f_minus_m2_', @test, '_', @code, '  ;
');

PREPARE stmt FROM @query5;
EXECUTE stmt;

END                               
//
DELIMITER ;  





/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS f_minus_m_last_by5//


/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE f_minus_m_last_by5(IN cod varchar(100))      
BEGIN

SET @code = cod;

SET @query1 = CONCAT('
/*create table*/
CREATE TEMPORARY TABLE f_minus_m_all_by5_', @code, '  
(
    name varchar(10), 
    f_minus_m int(10)
);
');

PREPARE stmt FROM @query1;
EXECUTE stmt;


CALL f_minus_m1('art', cod);
CALL f_minus_m1('lite', cod);
CALL f_minus_m1('music', cod);
CALL f_minus_m1('theater', cod);
CALL f_minus_m1('else', cod);

SET @query100 = CONCAT('
SELECT * FROM f_minus_m_all_by5_', @code, ' 
ORDER BY f_minus_m;
');

PREPARE stmt FROM @query100;
EXECUTE stmt;



END                               
//
DELIMITER ;  



/*女性の方が芸術に関心*/

/*use procedure 東京*/
CALL f_minus_m_last_by5('R13000');

/*use procedure 奈良*/
CALL f_minus_m_last_by5('R29000');

/*use procedure 香川*/
CALL f_minus_m_last_by5('R37000');




/*男性の方が芸術に関心*/

/*use procedure 埼玉*/
CALL f_minus_m_last_by5('R11000');

/*use procedure 大阪*/
CALL f_minus_m_last_by5('R27000');

/*use procedure 岡山*/
CALL f_minus_m_last_by5('R33000');

/*use procedure 北海道*/
CALL f_minus_m_last_by5('R01000');

/*use procedure 青森*/
CALL f_minus_m_last_by5('R02000');





ALTER TABLE artf RENAME TO score_art_female;
ALTER TABLE litef RENAME TO score_literature_female;
ALTER TABLE musicf RENAME TO score_music_female;
ALTER TABLE theaterf RENAME TO score_theater_female;
ALTER TABLE elsef RENAME TO score_else_female;

ALTER TABLE artm RENAME TO score_art_male;
ALTER TABLE litem RENAME TO score_literature_male;
ALTER TABLE musicm RENAME TO score_music_male;
ALTER TABLE theaterm RENAME TO score_theater_male;
ALTER TABLE elsem RENAME TO score_else_male;


ALTER TABLE score_art_female RENAME COLUMN score TO score_art_female;
ALTER TABLE score_literature_female RENAME COLUMN score TO score_literature_female;
ALTER TABLE score_music_female RENAME COLUMN score TO score_music_female;
ALTER TABLE score_theater_female RENAME COLUMN score TO score_theater_female;
ALTER TABLE score_else_female RENAME COLUMN score TO score_else_female;

ALTER TABLE score_art_male RENAME COLUMN score TO score_art_male;
ALTER TABLE score_literature_male RENAME COLUMN score TO score_literature_male;
ALTER TABLE score_music_male RENAME COLUMN score TO score_music_male;
ALTER TABLE score_theater_male RENAME COLUMN score TO score_theater_male;
ALTER TABLE score_else_male RENAME COLUMN score TO score_else_male;

