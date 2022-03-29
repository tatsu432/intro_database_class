/*combine artscore and score_all_art*/
CREATE TABLE score_art_hobby_time
SELECT artscore.Code AS Code, artscore.Prefecture AS Prefecture, artscore.MG15 AS MG15, score_all_art.score_all_art AS score_all_art
FROM artscore
    INNER JOIN score_all_art
        ON artscore.Code = score_all_art.Code
ORDER BY Code DESC;

/*check the table*/
SELECT * FROM score_art_hobby_time;  