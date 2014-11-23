## plot5.R
# setwd("~/Documents/MOOC/Coursera/Exploratory_Data_Analysis/Week3")


## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate total emissions by year
BaltimoreVehicleNEI <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BaltimoreVehicleTotalEmissionsByYear <- aggregate(Emissions ~ year, BaltimoreVehicleNEI, sum)

## Plot chart
png("plot5.png")
barplot(BaltimoreVehicleTotalEmissionsByYear$Emissions,
        names.arg=BaltimoreVehicleTotalEmissionsByYear$year,
        xlab="Year", 
        ylab="Total PM2.5 emissions (tons)",
        main="PM2.5 vehicle emissions in Baltimore from 1999 to 2008")
dev.off()


