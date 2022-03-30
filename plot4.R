library(dplyr)
library(ggplot2)
g <- readRDS("summarySCC_PM25.rds")
f <- readRDS("Source_Classification_Code.rds")
SCCsofCoal <- f 
  filter(grepl("coal", EI.Sector, ignore.case=TRUE))
  select(f)
emissionsyear <- g
  filter(f %in% SCCsofCoal$f)
  group_by(year) 
  summarize(allemissions = sum(Emissions))
emissionsyear$year <- as.factor(emissionsyear$year)
ggplot(emissionsyear, aes(x=year, y=allemissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("US PM2.5 Emissions from Coal Related Sources")
dev.copy(png,'plot4.png')
dev.off()

