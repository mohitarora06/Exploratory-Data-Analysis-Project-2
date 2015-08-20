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
head(DATA) <- merge(subset_SCC, DATA , by="SCC", all.x=TRUE)

#Subsetting data
data_subset <- subset(DATA, fips == "24510" | fips == "06037")
data_subset$city <- ifelse(data_subset$fips == "24510", "Baltimore City", "Los Angeles County")

#plotting
png("plot6.png") #Saving the plot
g <- ggplot(data_subset, aes(x = factor(year), y = Emissions))
g <- g + geom_bar(aes(fill = city), stat = "identity", position = "dodge") + labs(x = "Year") + 
    labs(y = "Emission (Tons)") + theme_bw()
print(g)
dev.off()
