#データの読み込み
DF <- read.table("for_figure.csv", 
                 sep = ",", 
                 header = TRUE, 
                 stringsAsFactors = FALSE, 
                 fileEncoding="UTF-8-BOM")

#内容を確認
head(DF)



#線形回帰モデルの作成lm0
lm0 <- lm(芸術指標 ~ 学習.自己啓発 + 外国語 + ビジネス + バレーボール + 
                釣り + 登山 + 国際活動 + テレビラジオ.新聞.雑誌, data = DF)
summary(lm0)

#分散分析
AOV0 <- aov(lm0)
summary(AOV0)

#AIC）の確認
AIC(lm0)

#BICの確認
BIC(lm0)

#残差の分布
par(mfrow=c(2, 2))
plot(lm0)
par(mfrow=c(1, 1))

#多重共線性の確認
library(car)
vif(lm0)

#標準偏回帰係数の作成
library(lm.beta)
LM0 <- lm.beta(lm0)
summary(LM0)




