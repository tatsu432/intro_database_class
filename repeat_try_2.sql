delimiter //            

DROP PROCEDURE IF EXISTS make_score//  

CREATE PROCEDURE make_score(IN col varchar(10))      
BEGIN                

set @test = col;
set @query = concat('SELECT Gender, Code, Prefecture, ', @test, ', FIND_IN_SET(
        ', @test, ', (
            SELECT GROUP_CONCAT(
            ', @test, ' ORDER BY ', @test, ' DESC
            )
            FROM artscore
        )
        ) AS ranking
        FROM artscore;');
prepare stmt from @query;
execute stmt;

END                               
//
delimiter ;     


call make_score('MD02')

