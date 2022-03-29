/*create the table for deviation value*/
CREATE TABLE sd_art
SELECT *, 10 * 
    (score_art - (SELECT AVG(score_art) FROM score_art )) /
    POW((SELECT AVG(POW(score_art - (SELECT AVG(score_art) FROM score_art ), 2)) FROM score_art ), 0.5) + 
    50
    AS deviation_art
FROM score_art;


/*check the table*/
SELECT * FROM  sd_art;


/*create the table for deviation value*/
CREATE TABLE sd_literature
SELECT *, 10 * 
    (score_literature - (SELECT AVG(score_literature) FROM score_literature )) /
    POW((SELECT AVG(POW(score_literature - (SELECT AVG(score_literature) FROM score_literature ), 2)) FROM score_literature ), 0.5) + 
    50
    AS deviation_litearature
FROM score_literature;


/*check the table*/
SELECT * FROM  sd_literature;


/*create the table for deviation value*/
CREATE TABLE sd_music
SELECT *, 10 * 
    (score_music - (SELECT AVG(score_music) FROM score_music )) /
    POW((SELECT AVG(POW(score_music - (SELECT AVG(score_music) FROM score_music ), 2)) FROM score_music ), 0.5) + 
    50
    AS deviation_music
FROM score_music;


/*check the table*/
SELECT * FROM  sd_music;


/*create the table for deviation value*/
CREATE TABLE sd_theater
SELECT *, 10 * 
    (score_theater - (SELECT AVG(score_theater) FROM score_theater )) /
    POW((SELECT AVG(POW(score_theater - (SELECT AVG(score_theater) FROM score_theater ), 2)) FROM score_theater ), 0.5) + 
    50
    AS deviation_theater
FROM score_theater;


/*check the table*/
SELECT * FROM  sd_theater;


/*create the table for deviation value*/
CREATE TABLE sd_else
SELECT *, 10 * 
    (score_else - (SELECT AVG(score_else) FROM score_else )) /
    POW((SELECT AVG(POW(score_else - (SELECT AVG(score_else) FROM score_else ), 2)) FROM score_else ), 0.5) + 
    50
    AS deviation_else
FROM score_else;


/*check the table*/
SELECT * FROM  sd_else;


/*create the table for deviation value*/
CREATE TABLE sd_all_art
SELECT *, 10 * 
    (score_all_art - (SELECT AVG(score_all_art) FROM score_all_art )) /
    POW((SELECT AVG(POW(score_all_art - (SELECT AVG(score_all_art) FROM score_all_art ), 2)) FROM score_all_art ), 0.5) + 
    50
    AS deviation_all
FROM score_all_art;


/*check the table*/
SELECT * FROM  sd_all_art;
