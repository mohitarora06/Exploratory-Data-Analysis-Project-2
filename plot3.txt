#Script for project assignment 2 of Exploratory Data Analysis

#Loading library
library(ggplot2)

## Uploading data 
DATA <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subseting data to separate out baltimore data
baltimore_subset <- subset(DATA, fips == "24510")

#Ploting and modeling the data
png("plot3.png") #Saving the plot
g <- ggplot(baltimore_subset, aes(x = year, y = Emissions))
g <- g + geom_point(aes(color = type), size = 4) +  facet_grid(. ~ type) + geom_smooth(method=lm, size = 2) + theme_bw()
print(g)
dev.off()