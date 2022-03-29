#データの読み込み
DF <- read.table("for_figure.csv", 
                 sep = ",", 
                 header = TRUE, 
                 stringsAsFactors = FALSE, 
                 fileEncoding="UTF-8-BOM")

#内容を確認
head(DF)


#平行分析
library(psych)
result.prl <- fa.parallel(DF[, (4:23)], fm="ml")


#因子分析FA
resultFA1 <- fa(DF[, (4:23)], 
                fm = "ml",
                nfactors=4, 
                rotate = "varimax", 
                scores = "regression")

print(resultFA1, digits=2, srt=TRUE)

fa.diagram(resultFA1, 
           rsize=0.8, 
           e.size=0.1, 
           marg=c(.5, 5, .5, .5), 
           cex=.6
)

head(resultFA1$scores)


DFfa1 <- as.data.frame(resultFA1$scores)

#因子のデータフレームを追加
DFnew <- cbind(DF, DFfa1)
head(DFnew)

