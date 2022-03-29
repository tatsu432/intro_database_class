/*create all ranking table*/
CREATE TABLE score_all_art_rank
SELECT Code, Prefecture,  score_all_art, FIND_IN_SET(
         score_all_art, (
            SELECT GROUP_CONCAT(
             score_all_art ORDER BY  score_all_art DESC
            )
            FROM  score_all_art
        )
        ) AS ranking
FROM  score_all_art;

/*check the table*/
SELECT * FROM score_all_art_rank;



/*create male ranking table*/
CREATE TABLE score_all_art_male_rank
SELECT Code, Prefecture,  score_all_art_male, FIND_IN_SET(
         score_all_art_male, (
            SELECT GROUP_CONCAT(
             score_all_art_male ORDER BY  score_all_art_male DESC
            )
            FROM  score_all_art_male
        )
        ) AS ranking
FROM  score_all_art_male;

/*check the table*/
SELECT * FROM score_all_art_male_rank;



/*create female ranking table*/
CREATE TABLE score_all_art_female_rank
SELECT Code, Prefecture,   score_all_art_female, FIND_IN_SET(
          score_all_art_female, (
            SELECT GROUP_CONCAT(
              score_all_art_female ORDER BY   score_all_art_female DESC
            )
            FROM   score_all_art_female
        )
        ) AS ranking
FROM   score_all_art_female;

/*check the table*/
SELECT * FROM score_all_art_female_rank;



/*modify the rank*/
UPDATE score_all_art_female_rank SET ranking = 2 WHERE Code = "R13000";

/*create male and female table*/
CREATE TABLE score_all_gender_rank
SELECT score_all_art_female_rank.Prefecture AS Prefecture_female, score_all_art_male_rank.Prefecture AS Prefecture_male, score_all_art_male_rank.ranking AS ranking
FROM score_all_art_female_rank
    INNER JOIN score_all_art_male_rank
        ON score_all_art_female_rank.ranking = score_all_art_male_rank.ranking
ORDER BY ranking;

/*check the table*/
SELECT * FROM score_all_gender_rank;
