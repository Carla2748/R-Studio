library(dplyr)
library(ggplot2)

#Getting the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

#subsetting data for Baltimore
carSCC <- SCC[grepl("vehicle", SCC.Level.Two, ignore.case=TRUE), SCC]
carNEI <- NEI[NEI[, SCC] %in% carSCC,]
bal3 <- carNEI %>% select("fips","Emissions","year") %>% group_by(year) %>% 
      filter(fips=="24510") 
head(bal3)

#Plotting Vehicle emission per year
q5 <- ggplot(data=bal3, aes(x=as.factor(year), y=Emissions))+
      geom_bar(stat="identity",fill="magenta")+ ggtitle("Baltimore's Vehicle emissions per year")+
      xlab("Year")
q5

#Creating image of plot
png("q5.png", width=800, height=500)
dev.off()
