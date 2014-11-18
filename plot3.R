setwd("C:/Users/michael/Documents/R/explorcours/project2")

library(ggplot2)

##read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary(NEI)
str(NEI)
names(NEI)

##subsetting data for Baltimore

NEI_bal <- subset(NEI, fips == 24510)

NEI_bal$type <- as.factor(NEI_bal$type)

NEI$year <- as.factor(NEI$year)

summary(NEI_bal)

##plot3
png("plot3.png", width=680, height=480)

g <- ggplot(NEI_bal, aes(factor(year), Emissions, fill = type))+
        facet_grid(. ~ type)+
        geom_bar( stat = "identity")+ 
        guides(fill=F)+
        xlab("year") + ylab("PM2.5 Emissions (Tons)") +
        ggtitle("PM2.5 Emissions by source Type \n Baltimore City (1999-2008)")+
        theme(aspect.ratio=2)
print(g)

dev.off()


##The non-road, nonpoint, on-road source types have  seen decreased emissions 
## from 1999-2008 in Baltimore City.

##Only the point source type increased between 1999 and 2008
        