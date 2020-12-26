library(dplyr)
library(stringr)
library(ggplot2)

#Getting the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

#Getting the coal emission filtered

coal <- SCC %>% select(SCC,SCC.Level.Four) %>% filter(str_detect(SCC.Level.Four, "coal"))
head(coal)
combustionNEI <- NEI[NEI[,SCC] %in% coal]

#Plotting Coal emission per year
q4 <- ggplot(data=combustionNEI, aes(x=year, y=Emissions))+
      geom_bar(stat="identity")+ ggtitle("USA coal emissions per year")
q4


#Creating image of plot
png("q4.png", width=800, height=500)
dev.off()
