/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS make_score//

/*create PROCEDURE*/
delimiter //                        
CREATE PROCEDURE make_score(IN x varchar(10))      
BEGIN

CREATE TABLE dummy                     
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
    SELECT Gender, Code, Prefecture, x, FIND_IN_SET(
        MD13, (
            SELECT GROUP_CONCAT(
            x ORDER BY x DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore
) AS art;

END                               
//
delimiter ;  

/*use PROCEDURE*/
CALL make_score('MD13');

/*rename table*/
RENAME TABLE dummy TO md13;



/*delete PROCEDURE*/
DELIMITER //

DROP PROCEDURE IF EXISTS make//

/*create PROCEDURE*/
delimiter //                        
CREATE PROCEDURE make(IN x varchar(10))      
BEGIN

CREATE TABLE dummy                     
    SELECT Gender, Code, Prefecture, x, FIND_IN_SET(
        MD13, (
            SELECT GROUP_CONCAT(
            x ORDER BY x DESC
            )
            FROM artscore
        )
        ) AS ranking
    FROM artscore;

END                               
//
delimiter ;  

/*use PROCEDURE*/
CALL make('MD13');

/*see table*/
SELECT * FROM dummy;