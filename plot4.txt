#Script for project assignment 2 of Exploratory Data Analysis

#Loading library
library(ggplot2)

## Uploading data 
DATA <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting data for source names
subset_SCC <- SCC[,c("SCC", "EI.Sector")]

#Merging emission names with their respective SCC
DATA <- merge(subset_SCC, DATA , by="SCC", all.x=TRUE)

#Subsetting data based on coal
subset_DATA <- DATA[grep("Coal", DATA$EI.Sector), ]

#plotting and modelling
png("plot4.png") #Saving the plot
g <- ggplot(subset_DATA, aes(x = year, y = Emissions))
g <- g + geom_point(aes(color = EI.Sector), size = 4) +  facet_grid(. ~ EI.Sector) + geom_smooth(method=lm, size = 2) + theme_bw()
print(g)
dev.off()