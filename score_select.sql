/*create artscore table*/
CREATE TABLE artscore
SELECT * FROM jlife WHERE Gender = 'Total' AND Code <> 'R00000';

/*check the table*/                                                                                
SELECT Gender, Code, Prefecture, MD13 FROM artscore;  