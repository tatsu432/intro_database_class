library(RMySQL)
library(DBI)

drv <- dbDriver("MySQL")

conn <- dbConnect(
  drv,
  host = "localhost", 
  port = 3306, 
  user = "ensyu",
  password = "+oYAyjXh",
  dbname = "us21304"
)

#データベーステーブルの表示
dbListTables(conn)

#データフレームにデータベースのデータをインポート
DF <- dbGetQuery(conn, "SELECT * FROM t_shimizu")

#データフレームの先頭表示
head(DF)

#MySQLサーバーから切断
dbDisconnect(conn)