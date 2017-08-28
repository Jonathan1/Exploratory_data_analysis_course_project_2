library(ggplot2)

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
aggregated_bc <- aggregate(Emissions ~ year + type, baltimore_city, sum)


#make the plot
png("plot3.png")
bc_plot <- ggplot(aggregated_bc, aes(year, Emissions, color = type))

bc_plot <- bc_plot + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions in Tons") +
	ggtitle('Total PM2.5 Emissions in Tons from Baltimore City at Various Years')

print(bc_plot)
dev.off()

