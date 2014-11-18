setwd("C:/Users/michael/Documents/R/explorcours/project2")

##read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary(NEI)
str(NEI)
names(NEI)

#setting year as factors 

NEI$year <- as.factor(NEI$year)

##Emmisions per year

Emi_year <-  aggregate(Emissions ~ year,NEI, sum)

##plot 1

png("plot1.png")

barplot(Emi_year$Emissions/1000000, names.arg = c("1999", "2002", "2005", "2008"), xlab = "year"
        , ylab="PM2.5 Emissions", main="Total PM2.5 Emissions From  US Sources",
        col = "darkslategray4")

legend("topright", "in millions of tons")

dev.off()

##We can observe that total emissions have decrease in UsA from 1999 to 2008