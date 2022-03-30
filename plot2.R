library(dplyr)
c <- readRDS("summarySCC_PM25.rds")
d <- readRDS("Source_Classification_Code.rds")
emmits <- c %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarize(fullemissions = sum(Emissions))
with(emmits, barplot(fullemissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (In tons)", main = "Total PM2.5 Emissions of Baltimore City"))
dev.copy(png,'plot2.png')
dev.off()