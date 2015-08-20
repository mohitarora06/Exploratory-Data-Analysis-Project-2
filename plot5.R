#Script for project assignment 2 of Exploratory Data Analysis

#Loading libraries
library(ggplot2)
library(gridExtra)

## Uploading data 
DATA <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting data for source names
subset_SCC <- SCC[,c("SCC", "EI.Sector")]


#Merging emission names with their respective SCC
DATA <- merge(subset_SCC, DATA , by="SCC", all.x=TRUE)

#Subseting data to separate out baltimore data
baltimore_subset <- subset(DATA, fips == "24510")

#Subsetting data based on coal
subset_DATA <- baltimore_subset[grep("Mobile", baltimore_subset$EI.Sector), ]

#plotting and modelling
png("plot5.png") #Saving the plot
g <- ggplot(subset_DATA, aes(x = year, y = Emissions))
g <- g + geom_point(aes(color = EI.Sector),size = 4) +  facet_grid(.~ EI.Sector) +  geom_smooth(method="lm", size = 2) +theme(axis.text.x = element_text(angle = 90, hjust = 1))
print(g)
dev.off()


