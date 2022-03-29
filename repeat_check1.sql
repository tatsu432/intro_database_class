delimiter //                        
CREATE PROCEDURE make_score(IN col varchar(10))      
BEGIN                

SELECT col FROM artscore;

END                               
//
delimiter ;     

drop PROCEDURE make_score
