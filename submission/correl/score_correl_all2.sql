CREATE TABLE all_correl(
    name varchar(10), 
    correl float
);

/*delete PROCEDURE*/
DELIMITER //
DELETE FROM all_correl;
DROP PROCEDURE IF EXISTS make_combination//
DROP PROCEDURE IF EXISTS make_avg//
DROP PROCEDURE IF EXISTS make_sd//
DROP PROCEDURE IF EXISTS make_correl//
DROP PROCEDURE IF EXISTS make_name//
DROP PROCEDURE IF EXISTS make_name2//
DROP PROCEDURE IF EXISTS make_table//
DROP PROCEDURE IF EXISTS insert_cor//
DROP PROCEDURE IF EXISTS make_correl_all//


/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_combination(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @query = CONCAT('
/*combine artscore and chosen col*/
CREATE TEMPORARY TABLE ', @test2, ' 
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





/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_avg(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @query = CONCAT('
/*create average table*/
CREATE TEMPORARY TABLE ', @test3, ' 
SELECT AVG( ', @test, ' ) AS x_avg, AVG(score_all_art) AS y_avg 
FROM  ', @test2, ' ;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  


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
CREATE TEMPORARY TABLE ', @test4, '  
SELECT POW( ', @test, '  - x_avg, 2) AS x_sd, POW(score_all_art - y_avg, 2) AS y_sd, ( ', @test, '  - x_avg) * (score_all_art - y_avg) AS cov 
FROM  ', @test2, ' ,  ', @test3, ' ;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  




/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_correl(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @test5 = CONCAT('cor_', col);
SET @query = CONCAT('
CREATE TEMPORARY TABLE ', @test5, ' 
SELECT SUM(cov) / (POW(SUM(x_sd), 0.5) * POW(SUM(y_sd), 0.5)) AS correlation FROM  ', @test4, ' ;  
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  



/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_name(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @test5 = CONCAT('cor_', col);
SET @test6 = CONCAT('name_', col);
SET @query = CONCAT('
CREATE TEMPORARY TABLE  ', @test6, ' (
    name varchar(10)
);
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  






/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_name2(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @test5 = CONCAT('cor_', col);
SET @test6 = CONCAT('name_', col);
SET @query = CONCAT('
INSERT INTO  ', @test6, ' (name) VALUES( ''', @test, ''' );
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  





/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_table(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @test5 = CONCAT('cor_', col);
SET @test6 = CONCAT('name_', col);
SET @test7 = CONCAT('table_', col);
SET @query = CONCAT('
CREATE TEMPORARY TABLE   ', @test7, ' 
SELECT name, correlation 
FROM  ', @test5, ' 
,  ', @test6, ' ;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  





/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE insert_cor(IN col varchar(10))      
BEGIN
SET @test = col;
SET @test2 = CONCAT('score_art_', col);
SET @test3 = CONCAT('avg_', col);
SET @test4 = CONCAT('sd_', col);
SET @test5 = CONCAT('cor_', col);
SET @test6 = CONCAT('name_', col);
SET @test7 = CONCAT('table_', col);
SET @query = CONCAT('
INSERT INTO all_correl (name, correl)
SELECT name, correlation FROM  ', @test7, ' ;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  






/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_correl_all(IN col varchar(10))      
BEGIN

CALL make_combination(col);
CALL make_avg(col);
CALL make_sd(col);
CALL make_correl(col);
CALL make_name(col);
CALL make_name2(col);
CALL make_table(col);
CALL insert_cor(col);

END                               
//
DELIMITER ;  
















CALL make_correl_all('MA00');
CALL make_correl_all('MB00');
CALL make_correl_all('MB01');
CALL make_correl_all('MB011');
CALL make_correl_all('MB012');
CALL make_correl_all('MB02');
CALL make_correl_all('MB021');
CALL make_correl_all('MB022');
CALL make_correl_all('MB03');
CALL make_correl_all('MB04');
CALL make_correl_all('MB05');
CALL make_correl_all('MB06');
CALL make_correl_all('MB07');
CALL make_correl_all('MC01');
CALL make_correl_all('MC02');
CALL make_correl_all('MC03');
CALL make_correl_all('MC04');
CALL make_correl_all('MC05');
CALL make_correl_all('MC06');
CALL make_correl_all('MC07');
CALL make_correl_all('MC08');
CALL make_correl_all('MC09');
CALL make_correl_all('MC10');
CALL make_correl_all('MC11');
CALL make_correl_all('MC12');
CALL make_correl_all('MC13');
CALL make_correl_all('MC14');
CALL make_correl_all('MC15');
CALL make_correl_all('MC16');
CALL make_correl_all('MC17');
CALL make_correl_all('MC18');
CALL make_correl_all('MC19');
CALL make_correl_all('MC20');
CALL make_correl_all('MC21');
CALL make_correl_all('MC22');
CALL make_correl_all('MD01');

CALL make_correl_all('MD12');

CALL make_correl_all('MD18');
CALL make_correl_all('MD19');
CALL make_correl_all('MD20');
CALL make_correl_all('MD21');
CALL make_correl_all('MD22');

CALL make_correl_all('MD28');
CALL make_correl_all('MD29');
CALL make_correl_all('MD30');
CALL make_correl_all('MD31');
CALL make_correl_all('MD32');
CALL make_correl_all('MD33');
CALL make_correl_all('MD34');
CALL make_correl_all('ME00');
CALL make_correl_all('ME01');
CALL make_correl_all('ME02');
CALL make_correl_all('ME03');
CALL make_correl_all('ME04');
CALL make_correl_all('ME05');
CALL make_correl_all('ME06');
CALL make_correl_all('ME07');
CALL make_correl_all('ME08');
CALL make_correl_all('ME09');
CALL make_correl_all('ME10');
CALL make_correl_all('ME11');
CALL make_correl_all('MF00');
CALL make_correl_all('MF01');
CALL make_correl_all('MF02');
CALL make_correl_all('MF021');
CALL make_correl_all('MF0211');
CALL make_correl_all('MF0212');
CALL make_correl_all('MF022');
CALL make_correl_all('MG01');
CALL make_correl_all('MG02');
CALL make_correl_all('MG03');
CALL make_correl_all('MG04');
CALL make_correl_all('MG05');
CALL make_correl_all('MG06');
CALL make_correl_all('MG07');
CALL make_correl_all('MG08');
CALL make_correl_all('MG09');
CALL make_correl_all('MG10');
CALL make_correl_all('MG11');
CALL make_correl_all('MG12');
CALL make_correl_all('MG13');
CALL make_correl_all('MG14');
CALL make_correl_all('MG15');
CALL make_correl_all('MG16');
CALL make_correl_all('MG17');
CALL make_correl_all('MG18');
CALL make_correl_all('MG19');
CALL make_correl_all('MG20');
CALL make_correl_all('MG51');
CALL make_correl_all('MG52');
CALL make_correl_all('MG53');


SELECT * FROM all_correl
ORDER BY correl DESC;








