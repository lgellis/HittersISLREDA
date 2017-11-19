

install.packages("devtools")
install.packages("wordcloud")
install.packages("gcookbook")
install.packages("ISLR")

install.packages("car")
install.packages("plyr")
install.packages("caret")
install.packages("ggplot2")


install.packages("car")
install.packages("plyr")
install.packages("caret")
install.packages("ggplot2")

install.packages("qcc")
install.packages("PerformanceAnalytics")

install.packages("GGally")
install.packages("fmsb")

library (ISLR)
library(car)
library(plyr)
library(ggplot2)

library(dplyr)
require(caret)
require(qcc)
library(PerformanceAnalytics)

library(dplyr)
require(caret)
require(qcc)
library(PerformanceAnalytics)
library(GGally)
library(gcookbook)
library(fmsb)
library(wordcloud)
library("devtools")



dim(Hitters)
head(Hitters)
#is.na() shows rows that are missing variables
sum(is.na(Hitters$Salary))

attach(Hitters)

p <- ggplot(Hitters, aes(League))
p + geom_bar()



#2) stacked bar chart
qplot(Years, data=Hitters, fill=League)

#Code Starting Point Credit: http://docs.ggplot2.org/dev/vignettes/qplot.html

#3) Scatter plot with the colors coded.
qplot(Salary, CRBI, data=Hitters, color=League)

#Code Starting Point Credit: http://docs.ggplot2.org/dev/vignettes/qplot.html



#6) Boxplot with mulitple factors and outliers highlighted
x <-ggplot(Hitters, aes(factor(League), Salary))
x + geom_boxplot(aes(fill=factor(Division)), outlier.color="red", outlier.shape = "star", outlier.size=4)


#4) Regression Lines
qplot(Salary, CRBI, data=Hitters, color=League, geom=c("point", "smooth"))

#Code Starting Point Credit: http://docs.ggplot2.org/dev/vignettes/qplot.html


#5)Facets and Panels

#Then try using facets
qplot(Salary, CRBI, data=Hitters, facets=.~League, geom=c("point", "smooth"))


#Code Starting Point Credit: https://www.youtube.com/watch?v=HeqHMM4ziXA

# continued) Using Panels or Facets
qplot(Years, data=Hitters, facets=.~League)
#Or horizontally
qplot(Years, data=Hitters, facets=League~.)

#Code Starting Point Credit: https://www.youtube.com/watch?v=HeqHMM4ziXA


#6) Boxplot with mulitple factors and outliers highlighted
x <-ggplot(Hitters, aes(factor(League), Salary))
x + geom_boxplot(aes(fill=factor(Division)), outlier.color="red", outlier.shape = "star", outlier.size=4)

#6) Boxplot with mulitple factors and outliers highlighted
x <-ggplot(Hitters, aes(factor(League), Salary))
x + geom_boxplot(aes(fill=factor(Division)), outlier.color="red", outlier.shape = "star", outlier.size=4)

#Code Starting Point Credit: https://www.youtube.com/watch?v=HeqHMM4ziXA

p <- ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_violin(aes(fill = cyl))



#7) Violin Plot
x <-ggplot(Hitters, aes(factor(League), Salary))
x + geom_violin(aes(fill=factor(Division)))

#Code Starting Point Credit: http://www.r-graph-gallery.com/95-violin-plot-with-ggplot2/


#8) Stacked area graph



ggplot(Hitters, aes(CRBI, Salary, fill=League)) +   geom_area() 

#Code Starting Point Credit: https://www.youtube.com/watch?v=HeqHMM4ziXA

#11) Levelplot

ggplot(Hitters, aes(HmRun, Division, z= Years)) + geom_tile(aes(fill = Years)) + theme_bw() +   scale_fill_gradient(low="white", high="red") 

#Code Starting Point Credit: http://www.r-graph-gallery.com/all-graphs/

#12) More detailed Scatterplot Matrix

#subset to the first four years to make graph more readable
Hitter4Yrs <- filter(Hitters, Hitters$Years<=4)

p <- qplot(Salary, CRBI, data=Hitter4Yrs, shape=Division, color=Division,
           facets=Years~League, main="Scatterplots of Salary vs CRBI",
           xlab="Salary", ylab="CRBI")

#11) Levelplot

ggplot(Hitters, aes(HmRun, Division, z= Years)) + geom_tile(aes(fill = Years)) + theme_bw() +   scale_fill_gradient(low="white", high="red") 

#Code Starting Point Credit: http://www.r-graph-gallery.com/all-graphs/

#12) More detailed Scatterplot Matrix

#subset to the first four years to make graph more readable
Hitter4Yrs <- filter(Hitters, Hitters$Years<=4)

p <- qplot(Salary, CRBI, data=Hitter4Yrs, shape=Division, color=Division,
           facets=Years~League, main="Scatterplots of Salary vs CRBI",
           xlab="Salary", ylab="CRBI")




########OTHER #####################
#Regression lines, loess and linear
x <-ggplot(Hitters, aes(Years, Salary))
x + geom_point() + geom_smooth()

#Or actually try a linear regression line b/c the bands are too flexible at the end
x <-ggplot(Hitters, aes(Years, Salary))
x + geom_point() + geom_smooth(method="lm")

#break out by league
x <-ggplot(Hitters, aes(Years, Salary))
x + geom_point() + facet_grid(.~League) + geom_smooth(method="lm") 

#Try formatting
x <-ggplot(Hitters, aes(Years, Salary))
x + geom_point() + facet_grid(.~League) + geom_smooth(method="lm") + theme_bw() +xlab("Years in League") +ylab("Player Salary") + ggtitle("Player Salary vs Year")#And trying theme







