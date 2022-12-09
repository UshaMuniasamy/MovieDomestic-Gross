#import data
getwd()
setwd("G:/R programming/advanced visualization/final project")
getwd()

mov <- read.csv("MovieDomestic%Cross.csv")

#data expolartion
head(mov)
tail(mov)
str(mov)

#factor
factor(mov$Genre)
factor(mov$Studio)
factor(mov$Movie.Title)
factor(mov$Release.Date)
factor(mov$Adjusted.Gross...mill.)
summary(mov)
str(mov)

#Activate ggplot2
#install package("ggplot2)
library(ggplot2)

#cool Insight:
ggplot(data=mov, aes(x=Day.of.Week))+geom_bar()

#filter #1 for the dataframe
filt <- (mov$Genre == "action") |(mov$Genre == "adventure")|(mov$Genre == "animation")|(mov$Genre == "comedy")|(mov$Genre == "drama")

#filter #2 
filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB" ,"Fox", "Sony","Universal","Paramount Pictures")

filt
filt2

mov2 <- mov[filt & filt2,]
mov2


#visualization process
#prepare  the plot's data and aes layer:

visual <- ggplot(data=mov2,aes(x=Genre, y=Gross...US))
visual

# add Geometrics
vp <- visual + 
    geom_jitter(aes(size=Budget...mill., colour=Studio))+
     geom_boxplot(alpha=0.7, outlier.colour = NA)
vp        

#non -data ink

vp <- vp +
          xlab ("Genre")+
          ylab("Gross % US")+
          ggtitle("Domestic Gross % by Genere")

#theme
vp <- vp+
    theme(
      axis.title.x = element_text(colour = "Blue",size = 10),
      axis.title.y = element_text(colour = "Blue",size = 10),
      axis.text.x = element_text(size = 10),
      axis.text.y = element_text(size = 10),
    
      plot.title = element_text(size = 15),
      legend.title = element_text(size = 15),
      legend.text = element_text(size = 15),
    
                  )
vp


#final touch
vp$labels$size <- "Budget $m"
vp
