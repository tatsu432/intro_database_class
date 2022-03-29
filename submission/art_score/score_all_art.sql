/*create aggregate score_music table*/
CREATE TABLE score_all_art
SELECT score_art.Code AS Code, score_art.Prefecture AS Prefecture, score_art.score_art + score_literature.score_literature + score_music.score_music + score_theater.score_theater + score_else.score_else AS score_all_art
FROM score_art
    INNER JOIN score_literature
        ON score_art.Code = score_literature.Code
    INNER JOIN score_music
        ON score_art.Code = score_music.Code
    INNER JOIN score_theater
        ON score_art.Code = score_theater.Code
    INNER JOIN score_else
        ON score_art.Code = score_else.Code
ORDER BY score_all_art DESC;

/*check the table*/
SELECT * FROM score_all_art;