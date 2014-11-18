setwd("C:/Users/michael/Documents/R/explorcours/project2")

library(ggplot2)

##read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary(SCC)
str(SCC)
names(SCC)

##subset for motor vehicle in baltimore

bal_ve <- subset(NEI, fips == "24510" & type == "ON-ROAD")

##Emmisions per year of baltimore vehicle

Emi_bal_ve <-  aggregate(Emissions ~ year,bal_ve, sum)

##plot 4
png("plot5.png")

plot5 <- ggplot(Emi_bal_ve, aes(factor(year), Emissions))+
        geom_bar( stat = "identity", fill = "orange", colour="black")+
        xlab("year") + ylab("Emissions (Tons)")+ 
        theme(axis.title.x=element_text(face="bold"))+
        theme(axis.title.y=element_text(face="bold"))+
        ggtitle("Emissions from motor vehicle sources, Baltimore City (1999-2008)")+
        theme(plot.title = element_text(lineheight=.8, face="bold"))
print(plot5)

dev.off()

##emissions from motor vehicle sources have decreased from 1999-2008 in Baltimore City.
