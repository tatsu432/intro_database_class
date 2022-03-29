/*check the table for deviation value*/
CREATE TABLE sd_else
SELECT *, 10 * 
    (score_else - (SELECT AVG(score_else) FROM score_else )) /
    POW((SELECT AVG(POW(score_else - (SELECT AVG(score_else) FROM score_else ), 2)) FROM score_else ), 0.5) + 
    50
    AS deviation_else
FROM score_else;


/*check the table*/
SELECT * FROM  sd_else;
