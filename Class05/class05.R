#' ---
#' title: "class05 R graphics intro WI 2019"
#' author: "Keerthana Karthikeyan"
#' date: "Jan 24th, 2019"
#' output: github_document
#' ---
#' class05 R graphics intro
#' This is some test and I can have **bold** and *italic* and 'code'

# My first boxplot
x<-rnorm(1000,0)
boxplot(x)


summary(x)
hist(x)
boxplot(x, horizontal = TRUE)

#Line plot
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
plot(weight$Age, weight$Weight, type = "o", 
     pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab = "Age (months)", 
     ylab="Weight (kg)", main="Baby Weight with Age")

#Barplot
mouse<- read.table("bimm143_05_rstats/feature_counts.txt", sep="\t", header=TRUE)
barplot(mouse$Count)
par(mar=c(3.1, 11.1, 4.1, 2))
barplot(mouse$Count, names.arg=mouse$Feature, 
        horiz=TRUE, ylab="", 
        main="Number of features in the mouse GRCm38 genome", 
        las=1, xlim=c(0,80000))

#Histogram
x<-c(rnorm(1000), rnorm(1000)+4)
hist(x, breaks=80)

par( mar=c(5, 4, 1, 1) ) 

#providing color vectors
mf <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(mf$Count,names.arg=mf$Sample, col=rainbow(nrow(mf)),  
        las=2, ylab="Counts")
barplot(mf$Count,names.arg=mf$Sample, col=c("blue", "red"), 
        las=2, ylab="Counts")

#Coloring by value
genes<-read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
palette(c("blue", "gray", "red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")

#Dynamic use of color
meth<-read.delim("bimm143_05_rstats/expression_methylation.txt")
dcols<-densCols(meth$gene.meth, meth$expression)
plot(meth$gene, meth$expression,col=dcols, pch=20)
inds <- meth$expression > 0
plot(meth$gene.meth[inds], meth$expression[inds])

dcols <- densCols(meth$gene.meth[inds], meth$expression[inds])
plot(meth$gene.meth[inds], meth$expression[inds], col = dcols, pch = 20)

dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds],
                         colramp = colorRampPalette(c("blue2",
                                                      "green2",
                                                      "red2",
                                                      "yellow")) )

plot(meth$gene.meth[inds], meth$expression[inds], 
     col = dcols.custom, pch = 20)

