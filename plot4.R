setwd("C:/Users/michael/Documents/R/explorcours/project2")

library(ggplot2)

##read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary(SCC)
str(SCC)
names(SCC)

##subsetting for coal combustion

cocomb <- grepl("Coal", SCC$EI.Sector)
sub1 <- subset(SCC, cocomb)
sub2 <- sub1$SCC

sub_NEI <- NEI[NEI$SCC %in% sub2,]


emicombcoal <- aggregate(Emissions ~ year, sum, data = sub_NEI)

##plot 4
png("plot4.png")

plot4 <- ggplot(sub_NEI, aes(factor(year), Emissions/1000))+
                geom_bar( stat = "identity", fill = "darkslategray")+
                xlab("year") + ylab("Emissions (thousand of Tons)")+ 
        theme(axis.title.x=element_text(face="bold"))+
        theme(axis.title.y=element_text(face="bold"))+
                ggtitle("coal combustion-related sources in US (1999-2008)")+
                theme(plot.title = element_text(lineheight=.8, face="bold"))
print(plot4)

dev.off()

##Across the United States, emissions from coal combustion-related sources 
##have decreased from 1999-2008.






