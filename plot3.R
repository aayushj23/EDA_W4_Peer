library(dplyr)
library(ggplot2)
e <- readRDS("summarySCC_PM25.rds")
f <- readRDS("Source_Classification_Code.rds")
yearlyemissions <- e %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarize(allemissions = sum(Emissions))
yearlyemissions$year <- as.factor(yearlyemissions$year)
ggplot(yearlyemissions, aes(x=year, y=allemissions)) + geom_bar(stat="identity") + facet_grid(. ~ type) + labs(x="Year", y="PM2.5 Emissions (In tons)") + ggtitle("Baltimore City PM2.5 Emission")
dev.copy(png,'plot3.png')
dev.off()

