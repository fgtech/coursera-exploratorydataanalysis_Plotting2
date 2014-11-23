## plot3.R
# setwd("~/Documents/MOOC/Coursera/Exploratory_Data_Analysis/Week3")


## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate total emissions by year and type
BaltimoreNEI <- NEI[NEI$fips=="24510",]
BaltimoreTotalEmissionsByYearType <- aggregate(Emissions ~ year + type, BaltimoreNEI, sum)

## Plot chart
library(ggplot2)
png("plot3.png")
ggplot(BaltimoreTotalEmissionsByYearType, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE) +
  facet_grid(. ~ type) +
  xlab("Year") +
  ylab("Total PM2.5 emission (tons)") +
  ggtitle("PM2.5 emissions in Baltimore from 1999 to 2008 by types")
dev.off()

