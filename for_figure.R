#データの読み込み
DF <- read.table("for_figure.csv", 
                 sep = ",", 
                 header = TRUE, 
                 stringsAsFactors = FALSE, 
                 fileEncoding="UTF-8-BOM")

#内容を確認
head(DF)




#相関行列の作成
COR1 <- cor(DF[, c(3,4:10)])
COR1

COR2 <- cor(DF[, c(3, 11:17)])
COR2

COR3 <- cor(DF[, c(3, 18:24)])
COR3


#相関係数のグラフ表示
library(qgraph)
qgraph(COR1, 
       minimum=.20,  
       labels=colnames(COR1), 
       edge.labels=T, 
       label.scale=F, 
       label.cex=0.8,
       edge.label.cex=1.4
)

qgraph(COR2, 
       minimum=.20,  
       labels=colnames(COR2), 
       edge.labels=T, 
       label.scale=F, 
       label.cex=0.8,
       edge.label.cex=1.4
)

qgraph(COR3, 
       minimum=.20,  
       labels=colnames(COR3), 
       edge.labels=T, 
       label.scale=F, 
       label.cex=0.8,
       edge.label.cex=1.4
)