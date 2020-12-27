library(dplyr)

#Getting the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

#subsetting data for Baltimore
bal <- NEI %>% select("fips","Emissions","year") %>% group_by(year) %>% 
      filter(fips=="24510") %>% summarise(Emissions = sum(Emissions, na.rm = TRUE))
head(bal)

#Plotting Emission per year
plot(bal, pch=19, col="blue",main="Baltimore's emissions per year")

#Creating image of plot
png("q2.png", width=480, height=480)
dev.off()


