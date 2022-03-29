/*use PROCEDURE*/
CALL make_score('MD16');
CALL make_score('MD17');
CALL make_score('MD25');

/*create aggregate score_else table*/
CREATE TABLE score_else
SELECT MD16.Code AS Code, MD16.Prefecture AS Prefecture, MD16.score + MD17.score + MD25.score AS score_else
FROM MD16 
    INNER JOIN MD17 
        ON MD16.Code = MD17.Code
    INNER JOIN MD25 
        ON MD16.Code = MD25.Code
ORDER BY score_else DESC, Code;

/*check the table*/
SELECT * FROM score_else;