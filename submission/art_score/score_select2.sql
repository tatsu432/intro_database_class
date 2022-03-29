/*create artscore table*/
CREATE TABLE artscore
SELECT * FROM jlife WHERE Gender = 'Total' AND Code <> 'R00000';

/*create male only table*/
CREATE TABLE artscore_male
SELECT * FROM jlife WHERE Gender = 'Male' AND Code <> 'R00000';

/*create female only table*/
CREATE TABLE artscore_female
SELECT * FROM jlife WHERE Gender = 'Female' AND Code <> 'R00000';