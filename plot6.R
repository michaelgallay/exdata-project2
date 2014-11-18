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

##add city name

Emi_bal_ve[,3] <- rep("Baltimore", 4)

colnames(Emi_bal_ve)[3] <- "city"

##subset for motor vehicle in los Angeles country

la_ve <- subset(NEI, fips == "06037" & type == "ON-ROAD")

##Emmisions per year of los Angeles country vehicle

Emi_la_ve <-  aggregate(Emissions ~ year,la_ve, sum)

##add city name

Emi_la_ve[,3] <- rep("Los Angeles Country", 4)

colnames(Emi_la_ve)[3] <- "city"

##building new data.frame for baltimore and los angeles

new_df <- rbind(Emi_bal_ve, Emi_la_ve)


##plot6

png("plot6.png")

plot6 <- ggplot(new_df, aes(factor(year), Emissions, fill = year))+
        facet_grid(. ~city )+
        geom_bar( stat = "identity")+ 
        guides(fill=F)+
        xlab("year") + ylab("PM2.5 Emissions (Tons)") +
        ggtitle("PM2.5 Emissions from motor vehicle sources 
        Baltimore City & Los Angeles Country (1999-2008)")+
                
        theme(plot.title = element_text(lineheight=.8, face="bold"))
print(plot6)


dev.off()


##Los Angeles County has seen the greatest changes over time in motor vehicle emissions

