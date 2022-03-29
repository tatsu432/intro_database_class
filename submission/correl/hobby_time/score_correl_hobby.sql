/*create average table*/
CREATE TEMPORARY TABLE avg 
SELECT AVG(MG15) AS x_avg, AVG(score_all_art) AS y_avg 
FROM score_art_hobby_time;

/*create elements for calculation*/
CREATE TEMPORARY TABLE sd 
SELECT POW(MG15 - x_avg, 2) AS x_sd, POW(score_all_art - y_avg, 2) AS y_sd, (MG15 - x_avg) * (score_all_art - y_avg) AS cov 
FROM score_art_hobby_time, avg;
 
SELECT SUM(cov) / (POW(SUM(x_sd), 0.5) * POW(SUM(y_sd), 0.5)) AS correlation FROM sd; 