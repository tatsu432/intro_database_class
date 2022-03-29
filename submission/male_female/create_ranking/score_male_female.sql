/*create male and female table*/
CREATE TABLE score_all_gender
SELECT score_all_art_female.Code AS Code, score_all_art_female.Prefecture AS Prefecture, score_all_art_female.score_all_art_female AS female, score_all_art_male.score_all_art_male AS male
FROM score_all_art_female
    INNER JOIN score_all_art_male
        ON score_all_art_female.Code = score_all_art_male.Code
ORDER BY Code;

/*check the table*/
SELECT * FROM score_all_gender;