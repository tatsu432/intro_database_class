#データの読み込み
DF <- read.table("box_plot.csv", 
                 sep = ",", 
                 header = TRUE, 
                 stringsAsFactors = FALSE, 
                 fileEncoding="UTF-8-BOM")

#内容を確認
head(DF)


library(ggplot2)
library(gridExtra)
ggplot(DF)+
  geom_boxplot(aes(y = 芸術指標, 
                   x = 世界遺産件数))