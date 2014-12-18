NEI <- readRDS(file = "C:\\Users\\Varun Manivannan\\CourseEra_R_program\\3.Exploratory Analysis\\summarySCC_PM25.rds")
SCC <- readRDS(file = "C:\\Users\\Varun Manivannan\\CourseEra_R_program\\3.Exploratory Analysis\\Source_Classification_Code.rds")

str(NEI)


## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
## Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question

## Calling the libary ggplot2
library(ggplot2)

## Creating a variable to store data for Baltimore city.

BaltimoreData <- NEI[NEI$fips == "24510", ]
str(BaltimoreData)

## Split the data based on Emissions for year and type.
aggregatedTotalByYear <- aggregate(Emissions ~ year + type, data = BaltimoreData,FUN = sum)
str(aggregatedTotalByYear)

## creating a background for plot.
png("plot3.png")

##creating a ggplot
## For gg plot it is important to save the graph a variable to have them saved.
g <- ggplot(data = aggregatedTotalByYear,aes(x = year,y = Emissions,color = type ))

## Adding graph lines and labels to the data
g <- g + geom_line() 
xlab("year") 
ylab(expression('Total PM'[2.5]*" Emissions")) 
ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')

## For ggplot the print function should be explicitly called for the variable to be displayed.Else the variable will only 
## be stored and not displayed.
print(g)

dev.off()
