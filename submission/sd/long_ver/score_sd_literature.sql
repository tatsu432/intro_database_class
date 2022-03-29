/*check the table for deviation value*/
CREATE TABLE sd_literature
SELECT *, 10 * 
    (score_literature - (SELECT AVG(score_literature) FROM score_literature )) /
    POW((SELECT AVG(POW(score_literature - (SELECT AVG(score_literature) FROM score_literature ), 2)) FROM score_literature ), 0.5) + 
    50
    AS deviation_litearature
FROM score_literature;


/*check the table*/
SELECT * FROM  sd_literature;
