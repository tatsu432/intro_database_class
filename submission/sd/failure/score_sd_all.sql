/*check the table*/
SELECT * FROM  score_deviation;


/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS make_sd//

/*create PROCEDURE*/
DELIMITER //                        
CREATE PROCEDURE make_sd(IN table_n varchar(10))      
BEGIN
SET @test = table_n;
set @test2 = CONCAT('sd_', table_n);
SET @query = CONCAT('
/*check the table for deviation value*/

CREATE TABLE  ', @test2, ' 
SELECT *, 10 * 
    ( ', @test, '  - (SELECT AVG( ', @test, ' ) FROM  ', @test, '  )) /
    POW((SELECT AVG(POW( ', @test, '  - (SELECT AVG( ', @test, ' ) FROM  ', @test, '  ), 2)) FROM  ', @test, '  ), 0.5) + 
    50
    AS deviation_value
FROM  ', @test, ' ;
');

PREPARE stmt FROM @query;
EXECUTE stmt;

END                               
//
DELIMITER ;  

CALL make_sd('score_art');
CALL make_sd('score_literature');
CALL make_sd('score_music');
CALL make_sd('score_theater');
CALL make_sd('score_else');
CALL make_sd('score_all_art');