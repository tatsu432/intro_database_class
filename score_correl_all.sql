/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS make_combination//
DROP PROCEDURE IF EXISTS make_avg//
DROP PROCEDURE IF EXISTS make_sd//
DROP PROCEDURE IF EXISTS make_correl//
DROP PROCEDURE IF EXISTS make_correl_all//
DROP TABLE IF EXISTS score_art_MD02//
DROP TABLE IF EXISTS avg_MD02//
DROP TABLE IF EXISTS sd_MD02//

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_combination(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @query = CONCAT('
/*combine artscore and chosen col*/
CREATE TABLE ', @test2, ' 
SELECT artscore.Code AS Code, artscore.Prefecture AS Prefecture, artscore.', @test, '  AS ', @test, ' , score_all_art.score_all_art AS score_all_art
FROM artscore
    INNER JOIN score_all_art
        ON artscore.Code = score_all_art.Code
ORDER BY Code;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  




/*delete PROCEDURE*/
DELIMITER //

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_avg(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @query = CONCAT('
/*create average table*/
CREATE TABLE ', @test3, ' 
SELECT AVG( ', @test, ' ) AS x_avg, AVG(score_all_art) AS y_avg 
FROM  ', @test2, ' ;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  




/*delete PROCEDURE*/
DELIMITER //

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_sd(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @query = CONCAT('
/*create elements for calculation*/
CREATE TABLE ', @test4, '  
SELECT POW( ', @test, '  - x_avg, 2) AS x_sd, POW(score_all_art - y_avg, 2) AS y_sd, ( ', @test, '  - x_avg) * (score_all_art - y_avg) AS cov 
FROM  ', @test2, ' ,  ', @test3, ' ;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  




/*delete PROCEDURE*/
DELIMITER //

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_correl(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @query = CONCAT('
SELECT SUM(cov) / (POW(SUM(x_sd), 0.5) * POW(SUM(y_sd), 0.5)) AS correlation FROM  ', @test4, ' ;  
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  






DROP PROCEDURE IF EXISTS make_combination//
DROP PROCEDURE IF EXISTS make_avg//
DROP PROCEDURE IF EXISTS make_sd//
DROP PROCEDURE IF EXISTS make_correl//





/*delete PROCEDURE*/
DELIMITER //

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_correl_all(IN col varchar(10))      
BEGIN

CALL make_combination(col)
CALL make_avg(col)
CALL make_sd(col)
CALL make_correl(col)

END                               
//
DELIMITER ;  

CALL make_correl_all('MD02');
