library(dplyr)
library(ggplot2)
N <- readRDS("summarySCC_PM25.rds")
S <- readRDS("Source_Classification_Code.rds")
yearwise_emission <- N 
  filter(fips %in% c("24510", "06037") & type == "ON-ROAD") 
  group_by(year, fips) 
  summarize(total_emissions = sum(Emissions))
  yearwise_emission$year <- as.factor(yearwise_emission$year)
  yearwise_emission$county_name <- factor(yearwise_emission$fips, levels=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City")) 
ggplot(yearwise_emission, aes(x=year, y=total_emissions)) + 
  geom_bar(stat="identity", aes(fill=county_name), position = "dodge") +
  guides(fill=guide_legend(title=NULL)) +
  labs(x="Year", y="PM2.5 Emissions (tons)") +
  ggtitle("Vehicle PM2.5 Emissions - Baltimore City and LA County") +
  theme(legend.position="bottom")
dev.copy(png,'plot6.png')
dev.off()
