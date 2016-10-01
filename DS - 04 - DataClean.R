# Extract and read files
# read.table can unzip

# About datasets
# Dimensions - basic information (number of rows / columns)
dim()

# Split a string based upon a character
cnames <- strsplit(cnames, "|", fixed=TRUE)

# Create a subset where a field equals a value and a second is contained in a vector
cnt0 <- subset(pm0, State.Code == 36 & county.site %in% both)

# Aggregate based on a field
NEIsum <- aggregate(NEImerge[,"Emissions"], by = list(NEImerge$year), sum)

# Filtering values for entries containing "coal"
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]

# Merging
NEImerge <- merge(NEI, SCCcoal, by = "SCC")
# Mergine columns from data sets, by a specific value
mrg <- merge(d0, d1, by="state")