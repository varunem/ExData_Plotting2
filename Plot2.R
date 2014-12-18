NEI <- readRDS(file = "C:\\Users\\Varun Manivannan\\CourseEra_R_program\\3.Exploratory Analysis\\summarySCC_PM25.rds")
SCC <- readRDS(file = "C:\\Users\\Varun Manivannan\\CourseEra_R_program\\3.Exploratory Analysis\\Source_Classification_Code.rds")

str(NEI)

NEI[NEI$fips == "24510", ]

BaltimoreData <- NEI[NEI$fips == "24510", ]

str(BaltimoreData)

## Split data based on year and pollution
aggregatedTotalByYear <- aggregate(Emissions ~ year,BaltimoreData,FUN = sum)
str(aggregatedTotalByYear)

## Creating a plot background.
png("plot2.png")

## Adding data and graphs to the background.
barplot(height =aggregatedTotalByYear$Emissions,names.arg = aggregatedTotalByYear$year,main = expression("Total Emissions by year - Baltimore city"),xlab = "Years",ylab = expression("total PM'[2.5]*' emission")

## Closing the device
dev.off()