/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS make_score//

/*create PROCEDURE*/
delimiter //                        
CREATE PROCEDURE make_score(IN col varchar(10))      
BEGIN
set @test = col;
set @query = concat('CREATE TABLE ', col, '
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
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;');

prepare stmt from @query;
execute stmt;

END                               
//
delimiter ;  