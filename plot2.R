## plot2.R
# setwd("~/Documents/MOOC/Coursera/Exploratory_Data_Analysis/Week3")


## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate total emissions by year
BaltimoreNEI <- NEI[NEI$fips=="24510",]
BaltimoreTotalEmissionsByYear <- aggregate(Emissions ~ year, BaltimoreNEI, sum)

## Plot chart
png("plot2.png")
barplot(BaltimoreTotalEmissionsByYear$Emissions,
     names.arg=BaltimoreTotalEmissionsByYear$year,
     xlab="Year", 
     ylab="Total PM2.5 emissions (tons)",
     main="PM2.5 emissions in Baltimore from 1999 to 2008")
dev.off()

