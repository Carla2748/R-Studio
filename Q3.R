library(dplyr)
library(ggplot2)

#Getting the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

#subsetting data for Baltimore
bal2 <- NEI %>% select("fips","type","Emissions","year") %>% group_by(year,type) %>% 
      filter(fips=="24510") %>% summarise(Emissions = sum(Emissions, na.rm = TRUE)) %>% 
      arrange(year)
head(bal2)

#Plotting Emission per type per year
q3 <- ggplot(data=bal2, aes(x=year, y=Emissions, colour=type))+
      geom_point()+
      geom_smooth()+
      ggtitle("Baltimor's emissions per type per year")
q3


#Creating image of plot
png("q3.png", width=800, height=500)
dev.off()
