/*use PROCEDURE*/
CALL make_score('MD06');
CALL make_score('MD07');
CALL make_score('MD08');
CALL make_score('MD09');
CALL make_score('MD10');
CALL make_score('MD11');

/*create aggregate score_music table*/
CREATE TABLE score_music
SELECT MD06.Code AS Code, MD06.Prefecture AS Prefecture, MD06.score + MD07.score + MD08.score + MD09.score + MD10.score + MD11.score AS score_music
FROM MD06
    INNER JOIN MD07
        ON MD06.Code = MD07.Code
    INNER JOIN MD08
        ON MD06.Code = MD08.Code
    INNER JOIN MD09
        ON MD06.Code = MD09.Code
    INNER JOIN MD10
        ON MD06.Code = MD10.Code
    INNER JOIN MD11
        ON MD06.Code = MD11.Code
ORDER BY score_music DESC, Code;

/*check the table*/
SELECT * FROM score_music;