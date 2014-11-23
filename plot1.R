## plot1.R
# setwd("~/Documents/MOOC/Coursera/Exploratory_Data_Analysis/Week3")


## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate total emissions by year
totalEmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

## Plot chart
png("plot1.png")
barplot(totalEmissionsByYear$Emissions,
     names.arg=totalEmissionsByYear$year, 
     xlab="Year", 
     ylab="Total PM2.5 emissions (tons)",
     main="PM2.5 emissions in US from 1999 to 2008")
dev.off()

