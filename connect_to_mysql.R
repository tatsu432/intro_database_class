library(RMySQL)
library(DBI)

drv <- dbDriver("MySQL")

conn <- dbConnect(
  drv,
  host = "localhost", 
  port = 3306, 
  user = "root",
  password = "+Tshimizu432",
  dbname = "skindata1"
)

#データベーステーブルの表示
dbListTables(conn)

#データフレームにデータベースのデータをインポート
DF <- dbGetQuery(conn, "SELECT * FROM t_shimizu")

#データフレームの先頭表示
head(DF)

#MySQLサーバーから切断
dbDisconnect(conn)