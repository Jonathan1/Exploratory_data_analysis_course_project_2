# Load RDS
# add if statements, because otherwise each run is gonna take a while
if (!exists("NEI")) {
	NEI <- readRDS("summarySCC_PM25.rds")
} 
if (!exists("SCC")) {
	SCC <- readRDS("Source_Classification_Code.rds")
}

# Aggregate
aggregated <- aggregate(Emissions ~ year, NEI, sum)

# Make the plot
# divide by 1000 otherwise it just doesnt make sense
png('plot1.png')
barplot(
	(aggregated$Emissions)/10^3,
	names.arg=aggregated$year,
	xlab="Year",
	ylab="PM2.5 Emissions in kilo tons",
	main="Total PM2.5 Emissions In Kilo Tons At Various Years"
)
dev.off()
