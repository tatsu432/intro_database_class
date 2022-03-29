/*use PROCEDURE*/
CALL make_score('MD02');
CALL make_score('MD15');
CALL make_score('MD23');
CALL make_score('MD24');

/*create aggregate score_art table*/
CREATE TABLE score_art
SELECT MD02.Code AS Code, MD02.Prefecture AS Prefecture, MD02.score + MD15.score + MD23.score + MD24.score AS score_art
FROM MD02
    INNER JOIN MD15
        ON MD02.Code = MD15.Code
    INNER JOIN MD23 
        ON MD02.Code = MD23.Code
    INNER JOIN MD24
        ON MD02.Code = MD24.Code
ORDER BY score_art DESC, Code;

/*check the table*/
SELECT * FROM score_art;