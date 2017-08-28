# Load RDS
# add if statements, because otherwise each run is gonna take a while
if (!exists("NEI")) {
	NEI <- readRDS("summarySCC_PM25.rds")
} 
if (!exists("SCC")) {
	SCC <- readRDS("Source_Classification_Code.rds")
}

#make subset of NEI for baltimore city
baltimore_city  <- NEI[NEI$fips=="24510", ]

# Aggregate baltimore city
aggregated_bc <- aggregate(Emissions ~ year, baltimore_city, sum)

#make the plot
png("plot2.png")

barplot(
	(aggregated_bc$Emissions)/10^3,
	names.arg=aggregated_bc$year,
	xlab="Year",
	ylab="PM2.5 Emissions in Kilo Tons",
	main="Total PM2.5 Emissions From Baltimore City In Kilo Tons"
)

dev.off()
