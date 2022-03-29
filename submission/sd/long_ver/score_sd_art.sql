/*check the table for deviation value*/
CREATE TABLE sd_art
SELECT *, 10 * 
    (score_art - (SELECT AVG(score_art) FROM score_art )) /
    POW((SELECT AVG(POW(score_art - (SELECT AVG(score_art) FROM score_art ), 2)) FROM score_art ), 0.5) + 
    50
    AS deviation_art
FROM score_art;


/*check the table*/
SELECT * FROM  sd_art;
