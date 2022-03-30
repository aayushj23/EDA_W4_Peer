library(dplyr)
a<- readRDS("summarySCC_PM25.rds")
b<- readRDS("Source_Classification_Code.rds")
yearwiseemission<- a 
  group_by(year) 
  summarize(completeemissions = sum(Emissions))
with(yearwiseemission, barplot(completeemissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from All Sources"))
dev.copy(png,'plot1.png')
dev.off()