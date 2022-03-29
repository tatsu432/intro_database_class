/*create all ranking table*/
CREATE TABLE IF NOT EXISTS score_all_art_rank
SELECT Code, Prefecture,  score_all_art, FIND_IN_SET(
         score_all_art, (
            SELECT GROUP_CONCAT(
             score_all_art ORDER BY  score_all_art DESC
            )
            FROM  score_all_art
        )
        ) AS ranking
FROM  score_all_art;



/*drop view */
DROP VIEW IF EXISTS art_time;

/*create view */
CREATE VIEW art_time AS 
SELECT score_all_art_rank.Code, score_all_art_rank.Prefecture, score_all_art_rank.score_all_art, score_all_art_rank.ranking, 
    artscore.MH01, artscore.MH02, artscore.MH03, artscore.MH04
FROM score_all_art_rank
    INNER JOIN artscore
    ON score_all_art_rank.Code = artscore.Code
ORDER BY ranking;


/*check view*/
SELECT * FROM art_time;


/*drop view */
DROP VIEW IF EXISTS avg_time;

/*create view */
CREATE VIEW avg_time AS 
SELECT MH01 AS avg01,  MH02 AS avg02, MH03 AS avg03, MH04 AS avg04
FROM  jlife
WHERE Gender = 'Total' AND Code ='R00000';

/*check view*/
SELECT * FROM avg_time;




/*drop view */
DROP VIEW IF EXISTS wake_time;

/*create view */
CREATE VIEW wake_time AS 
SELECT Prefecture, ranking, MH01
FROM  art_time
ORDER BY MH01;

/*check view*/
SELECT * FROM wake_time;
