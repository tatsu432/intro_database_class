/*combine artscore and score_all_art*/
CREATE TABLE score_art_heritage
SELECT score_all_art.Code AS Code, score_all_art.Prefecture AS Prefecture, heritage.both_h AS both_heritage, score_all_art.score_all_art AS score_all_art
FROM heritage
    INNER JOIN score_all_art
        ON heritage.Code = score_all_art.Code
ORDER BY Code;

/*check the table*/
SELECT * FROM score_art_heritage;


/*create average table*/
CREATE TEMPORARY TABLE avg 
SELECT AVG(both_heritage) AS x_avg, AVG(score_all_art) AS y_avg 
FROM score_art_heritage;

/*create elements for calculation*/
CREATE TEMPORARY TABLE sd  
SELECT POW(both_heritage - x_avg, 2) AS x_sd, POW(score_all_art - y_avg, 2) AS y_sd, (both_heritage - x_avg) * (score_all_art - y_avg) AS cov 
FROM score_art_heritage, avg;

SELECT SUM(cov) / (POW(SUM(x_sd), 0.5) * POW(SUM(y_sd), 0.5)) AS correlation FROM sd;
