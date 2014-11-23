## plot6.R
# setwd("~/Documents/MOOC/Coursera/Exploratory_Data_Analysis/Week3")


## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate total emissions by year 
BaltimoreVehicleNEI <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BaltimoreVehicleTotalEmissionsByYear <- aggregate(Emissions ~ year, BaltimoreVehicleNEI, sum)
BaltimoreVehicleTotalEmissionsByYear$county <- "Baltimore County"
BaltimoreVehicleTotalEmissionsByYear$evo1999 <- BaltimoreVehicleTotalEmissionsByYear$Emissions / 
  subset(BaltimoreVehicleTotalEmissionsByYear, year==1999)$Emissions
LosAngelesVehicleNEI <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
LosAngelesVehicleTotalEmissionsByYear <- aggregate(Emissions ~ year, LosAngelesVehicleNEI, sum)
LosAngelesVehicleTotalEmissionsByYear$county <- "Los Angeles County"
LosAngelesVehicleTotalEmissionsByYear$evo1999 <- LosAngelesVehicleTotalEmissionsByYear$Emissions / 
  subset(LosAngelesVehicleTotalEmissionsByYear, year==1999)$Emissions
MergedVehicleTotalEmissionsByYear <- rbind(BaltimoreVehicleTotalEmissionsByYear, LosAngelesVehicleTotalEmissionsByYear)

## Plot chart
library(ggplot2)
png("plot6.png")
ggplot(MergedVehicleTotalEmissionsByYear, aes(x=year, y=evo1999, fill=county)) +
  geom_line(size=.65) +
  geom_point(size=2) +
  geom_hline(yintercept=1, colour="blue") +
  theme_bw() + guides(fill=FALSE) +
  facet_grid(. ~ county) +
  xlab("Year") +
  ylab("Total PM2.5 emission compared with year 1999") +
  ggtitle("PM2.5 vehicle emissions in Baltimore and LA from 1999 to 2008")
dev.off()

