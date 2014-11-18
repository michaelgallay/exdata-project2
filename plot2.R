setwd("C:/Users/michael/Documents/R/explorcours/project2")

##read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary(NEI)
str(NEI)
names(NEI)

#setting year as factors 

NEI$year <- as.factor(NEI$year)

#subsetting data for baltimore from dataframe

NEI_bal <- subset(NEI, fips == 24510, select = "year")

summary(NEI_bal)


##Emmisions per year in baltimore

Emi_year_bal <-  aggregate(Emissions ~ year,NEI_bal, sum)

summary(Emi_year_bal)
##plot 2

png("plot2.png")

barplot(
        Emi_year_bal$Emissions,
        names.arg = c("1999", "2002", "2005", "2008"),
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From  Baltimore Sources",
        
        col = "darkslategray4"
)


dev.off()


##Even if we can observe an augmentation between 2002 and 2005, Total emission have decrease
        #in baltimore between 1999 and 2008