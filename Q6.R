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

#subsetting data for LA
carSCC <- SCC[grepl("vehicle", SCC.Level.Two, ignore.case=TRUE), SCC]
carNEI <- NEI[NEI[, SCC] %in% carSCC,]
la <- carNEI %>% select("fips","Emissions","year") %>% group_by(year) %>% 
      filter(fips=="06037") 
head(la)

#Combining LA and Bal data
bothcities <- rbind(bal3,la)

#Plotting Vehicle emission per year
q6 <- ggplot(data=bothcities, aes(x=as.factor(year), y=Emissions, fill=fips))+
      geom_bar(stat="identity")+ ggtitle("LA's vs Baltimore's Vehicle emissions per year")+
      xlab("Year")
q6

#Creating image of plot
png("q6.png", width=800, height=500)
dev.off()
