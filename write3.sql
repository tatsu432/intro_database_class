SELECT * FROM score_art_hobby_time
INTO OUTFILE "C:/Users/81808/waseda_class/intro_DataBase/write3.txt"
CHARACTER SET 'sjis'
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';