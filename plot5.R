library(dplyr)
library(ggplot2)
x1 <- readRDS("summarySCC_PM25.rds")
y1 <- readRDS("Source_Classification_Code.rds")
emissionsbyyear <- x1 %>%
  filter(fips == "24510" & type == "ON-ROAD") %>%
  group_by(year) %>%
  summarize(totalemissions = sum(Emissions))
emissionsbyyear$year <- as.factor(emissionsbyyear$year)
ggplot(emissionsbyyear, aes(x=year, y=totalemissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (In tons)") + ggtitle("Baltimore City PM2.5 Emissions (Vehicle Related Sources)")
dev.copy(png,'plot5.png')
dev.off()
