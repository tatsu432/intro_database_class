/*create score_all_art table by area*/
CREATE TABLE score_area1
SELECT *, CASE
    WHEN Prefecture 
    IN ("北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県")
    THEN "Hokkaido_Tohoku"
    WHEN Prefecture 
    IN ("茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県")
    THEN "Kanto"
    WHEN Prefecture 
    IN ("新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県")
    THEN "Tyubu"
    WHEN Prefecture 
    IN ("三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県")
    THEN "Kinki"
    WHEN Prefecture 
    IN ("鳥取県", "島根県", "岡山県", "広島県", "山口県")
    THEN "Tyugoku"
    WHEN Prefecture 
    IN ("徳島県", "香川県", "愛媛県", "高知県")
    THEN "Shikoku"
    WHEN Prefecture 
    IN ("福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県")
    THEN "Kyusyu"
    ELSE NULL
    END
    AS area
FROM score_all_art; 

/*create rankinging by area*/
CREATE TABLE score_area
SELECT area, AVG(score_all_art) AS score_all_art_avg 
FROM score_area1
GROUP BY area
ORDER BY score_all_art_avg DESC; 

/*check the table*/
SELECT * FROM score_area;