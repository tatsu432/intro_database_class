/*use PROCEDURE*/
CALL make_score('MD26');
CALL make_score('MD27');

/*create aggregate literature score table*/
CREATE TABLE score_literature
SELECT MD26.Code AS Code, MD26.Prefecture AS Prefecture, MD26.score + MD27.score AS score_literature
FROM MD26 INNER JOIN MD27 ON MD26.Code = MD27.Code
ORDER BY score_literature DESC, Code;

/*check the table*/
SELECT * FROM score_literature;