#Script for project assignment 2 of Exploratory Data Analysis

## Uploading data 
DATA <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Collecting out the data of emissions per year
PM2.5_per_Year <- aggregate(DATA$Emissions, by=list(DATA$year), FUN = sum, na.rm = TRUE) 
colnames(PM2.5_per_Year) <- c("Year", "Total_Emission")

#Ploting and modeling the data
png("plot1.png") #Saving the plot
with(PM2.5_per_Year, plot(Year, Total_Emission, pch = 20, ylab = "Total Emission (tons)"))
model <- lm(Total_Emission ~ Year, PM2.5_per_Year)
abline(model, lwd = 2, col = "blue")
dev.off()