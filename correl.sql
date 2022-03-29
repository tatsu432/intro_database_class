CREATE TABLE correl(x int, y int);
INSERT INTO correl VALUES(13,34);
(中略)
INSERT INTO correl VALUES(10,45);

CREATE TEMPORARY TABLE avg 
SELECT AVG(MD13) AS x_avg, AVG(MD14) AS y_avg 
FROM jlife
WHERE Gender = 'Total' AND Code <> 'R00000';

CREATE TEMPORARY TABLE sd 
SELECT POW(MD13 - x_avg, 2) AS x_sd, POW(MD14 - y_avg, 2) AS y_sd, (MD13 - x_avg) * (MD14 - y_avg) AS cov 
FROM jlife, avg 
WHERE Gender = 'Total' AND Code <> 'R00000';

SELECT SUM(cov) / (POW(SUM(x_sd), 0.5) * POW(SUM(y_sd), 0.5)) AS correlation FROM sd;