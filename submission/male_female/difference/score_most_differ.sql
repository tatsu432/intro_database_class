

DROP TABLE IF EXISTS f_minus_m_MD02;
DROP TABLE IF EXISTS name_MD02;
DROP TABLE IF EXISTS f_minus_m2_MD02;
DROP TABLE IF EXISTS f_minus_m_all_MD02;

DROP TABLE IF EXISTS f_minus_m_MD03;
DROP TABLE IF EXISTS name_MD03;
DROP TABLE IF EXISTS f_minus_m2_MD03;
DROP TABLE IF EXISTS f_minus_m_all_MD03;

DROP TABLE IF EXISTS f_minus_m_all_R13000;







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
INSERT INTO f_minus_m_all_', @code, '  (name, f_minus_m)
SELECT * FROM f_minus_m2_', @test, '_', @code, '  ;
');

PREPARE stmt FROM @query5;
EXECUTE stmt;

END                               
//
DELIMITER ;  





/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS f_minus_m_last//


/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE f_minus_m_last(IN cod varchar(100))      
BEGIN

SET @code = cod;

SET @query1 = CONCAT('
/*create table*/
CREATE TEMPORARY TABLE f_minus_m_all_', @code, '  
(
    name varchar(10), 
    f_minus_m int(10)
);
');

PREPARE stmt FROM @query1;
EXECUTE stmt;


CALL f_minus_m1('MD02', cod);
CALL f_minus_m1('MD03', cod);
CALL f_minus_m1('MD04', cod);
CALL f_minus_m1('MD05', cod);
CALL f_minus_m1('MD06', cod);
CALL f_minus_m1('MD07', cod);
CALL f_minus_m1('MD08', cod);
CALL f_minus_m1('MD09', cod);
CALL f_minus_m1('MD10', cod);
CALL f_minus_m1('MD11', cod);
CALL f_minus_m1('MD13', cod);
CALL f_minus_m1('MD14', cod);
CALL f_minus_m1('MD15', cod);
CALL f_minus_m1('MD16', cod);
CALL f_minus_m1('MD17', cod);
CALL f_minus_m1('MD23', cod);
CALL f_minus_m1('MD24', cod);
CALL f_minus_m1('MD25', cod);
CALL f_minus_m1('MD26', cod);
CALL f_minus_m1('MD27', cod);

SET @query100 = CONCAT('
SELECT * FROM f_minus_m_all_', @code, ' 
ORDER BY f_minus_m;
');

PREPARE stmt FROM @query100;
EXECUTE stmt;



END                               
//
DELIMITER ;  



/*女性の方が芸術に関心*/

/*use procedure 東京*/
CALL f_minus_m_last('R13000');

/*use procedure 奈良*/
CALL f_minus_m_last('R29000');

/*use procedure 香川*/
CALL f_minus_m_last('R37000');




/*男性の方が芸術に関心*/

/*use procedure 埼玉*/
CALL f_minus_m_last('R11000');

/*use procedure 大阪*/
CALL f_minus_m_last('R27000');

/*use procedure 岡山*/
CALL f_minus_m_last('R33000');

/*use procedure 北海道*/
CALL f_minus_m_last('R01000');

/*use procedure 青森*/
CALL f_minus_m_last('R02000');


