SELECT CONCAT(
	'DROP TABLE ', GROUP_CONCAT(
		CONCAT('`',table_name,'`')
	),';'
) AS statement FROM information_schema.tables 
WHERE table_schema = 'practice' AND table_name LIKE 'f_minus_%';












DROP TABLE IF EXISTS score_art_MD03//
DROP TABLE IF EXISTS avg_MD03//
DROP TABLE IF EXISTS sd_MD03//
DROP TABLE IF EXISTS cor_MD03//
DROP TABLE IF EXISTS name_MD03//
DROP TABLE IF EXISTS table_MD03//

