NEI <- readRDS(file = "C:\\Users\\Varun Manivannan\\CourseEra_R_program\\3.Exploratory Analysis\\summarySCC_PM25.rds")
SCC <- readRDS(file = "C:\\Users\\Varun Manivannan\\CourseEra_R_program\\3.Exploratory Analysis\\Source_Classification_Code.rds")

str(NEI)

## subsetting data to have emissions corresponding to year.
## tapply function was initially to have this split out data however, tapply does not seem
## break the data frame and it becomes difficult to call the variables in plotting.
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

str(aggregatedTotalByYear)

## Save the plot background
png('plot1.png')

## Plot the graph on the created background.
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))

##Switch off the graphic device
dev.off()
