library(dplyr)

#Getting the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

#subsetting data sum per year
sumnei <- NEI %>% select("Emissions","year") %>% group_by(year) %>% summarise(Emissions = sum(Emissions, na.rm = TRUE))
head(sumnei)

#Plotting Emission per year
plot(sumnei, pch=19, col="blue",main="Total PM2.5 emissions per year")

#Creating image of plot
png("q1.png", width=480, height=480)
dev.off()
