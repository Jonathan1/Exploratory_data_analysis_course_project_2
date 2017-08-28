library(ggplot2)

# Load RDS
# add if statements, because otherwise each run is gonna take a while
if (!exists("NEI")) {
	NEI <- readRDS("summarySCC_PM25.rds")
} 
if (!exists("SCC")) {
	SCC <- readRDS("Source_Classification_Code.rds")
} 


