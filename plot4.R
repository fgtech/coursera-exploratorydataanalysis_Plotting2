## plot4.R
# setwd("~/Documents/MOOC/Coursera/Exploratory_Data_Analysis/Week3")


## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate total emissions by year
CoalSCC <- SCC[grepl("Fuel Comb.*Coal", SCC$EI.Sector),]
CoalNEI <- NEI[(NEI$SCC %in% CoalSCC$SCC), ]
CoalTotalEmissionsByYear <- aggregate(Emissions ~ year, CoalNEI, sum)

## Plot chart
png("plot4.png")
barplot(CoalTotalEmissionsByYear$Emissions,
        names.arg=CoalTotalEmissionsByYear$year, 
        xlab="Year", 
        ylab="Total PM2.5 coal combustion emissions (tons)",
        main="PM2.5 coal combustion emissions in US from 1999 to 2008")
dev.off()

