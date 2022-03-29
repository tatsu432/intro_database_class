/*check the table for deviation value*/
CREATE TABLE sd_music
SELECT *, 10 * 
    (score_music - (SELECT AVG(score_music) FROM score_music )) /
    POW((SELECT AVG(POW(score_music - (SELECT AVG(score_music) FROM score_music ), 2)) FROM score_music ), 0.5) + 
    50
    AS deviation_music
FROM score_music;


/*check the table*/
SELECT * FROM  sd_music;
