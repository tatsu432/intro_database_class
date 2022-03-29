/*use PROCEDURE*/
CALL make_score('MD03');
CALL make_score('MD04');
CALL make_score('MD05');
CALL make_score('MD13');
CALL make_score('MD14');

/*create aggregate score_theater table*/
CREATE TABLE score_theater
SELECT MD03.Code AS Code, MD03.Prefecture AS Prefecture, MD03.score + MD04.score + MD05.score + MD13.score + MD14.score AS score_theater
FROM MD03
    INNER JOIN MD04
        ON MD03.Code = MD04.Code
    INNER JOIN MD05 
        ON MD03.Code = MD05.Code
    INNER JOIN MD13
        ON MD03.Code = MD13.Code
    INNER JOIN MD14
        ON MD03.Code = MD14.Code
ORDER BY score_theater DESC, Code;

/*check the table*/
SELECT * FROM score_theater;