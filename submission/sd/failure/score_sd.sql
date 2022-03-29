/*check the table for deviation value*/
CREATE TABLE score_deviation
SELECT *, 10 * 
    (score_all_art - (SELECT AVG(score_all_art) FROM score_all_art )) /
    POW((SELECT AVG(POW(score_all_art - (SELECT AVG(score_all_art) FROM score_all_art ), 2)) FROM score_all_art ), 0.5) + 
    50
    AS deviation_value
FROM score_all_art;


/*check the table*/
SELECT * FROM  score_deviation;