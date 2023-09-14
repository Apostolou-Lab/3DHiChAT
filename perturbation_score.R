
library(caret)
library(randomForest)
load("3DHiChAT.Rdata")

a<- read.csv('before.csv', sep="\t", header=T)
a1<- read.csv('after.csv', sep="\t", header=T)

a$random1<- predict(randomfor_chr1, a)
a$random2<- predict(randomfor_chr2, a)
a$random3<- predict(randomfor_chr3, a)
a$random4<- predict(randomfor_chr4, a)
a$random5<- predict(randomfor_chr5, a)
a$random6<- predict(randomfor_chr6, a)
a$random7<- predict(randomfor_chr7, a)
a$random8<- predict(randomfor_chr8, a)
a$random9<- predict(randomfor_chr9, a)
a$random10<- predict(randomfor_chr10, a)
a$random11<- predict(randomfor_chr11, a)
a$random12<- predict(randomfor_chr12, a)
a$random13<- predict(randomfor_chr13, a)
a$random14<- predict(randomfor_chr14, a)
a$random15<- predict(randomfor_chr15, a)
a$random16<- predict(randomfor_chr16, a)
a$random17<- predict(randomfor_chr17, a)
a$random18<- predict(randomfor_chr18, a)
a$random19<- predict(randomfor_chr19, a)
a$randomX<- predict(randomfor_chrX, a)

a1$random1<- predict(randomfor_chr1, a1)
a1$random2<- predict(randomfor_chr2, a1)
a1$random3<- predict(randomfor_chr3, a1)
a1$random4<- predict(randomfor_chr4, a1)
a1$random5<- predict(randomfor_chr5, a1)
a1$random6<- predict(randomfor_chr6, a1)
a1$random7<- predict(randomfor_chr7, a1)
a1$random8<- predict(randomfor_chr8, a1)
a1$random9<- predict(randomfor_chr9, a1)
a1$random10<- predict(randomfor_chr10, a1)
a1$random11<- predict(randomfor_chr11, a1)
a1$random12<- predict(randomfor_chr12, a1)
a1$random13<- predict(randomfor_chr13, a1)
a1$random14<- predict(randomfor_chr14, a1)
a1$random15<- predict(randomfor_chr15, a1)
a1$random16<- predict(randomfor_chr16, a1)
a1$random17<- predict(randomfor_chr17, a1)
a1$random18<- predict(randomfor_chr18, a1)
a1$random19<- predict(randomfor_chr19, a1)
a1$randomX<- predict(randomfor_chrX, a1)

before_removal = rowMeans( a[,c(12:31)], na.rm=TRUE)
after_removal  = rowMeans(a1[,c(12:31)], na.rm=TRUE)
pert_score<- 100*(before_removal-after_removal)/before_removal

pert_score






