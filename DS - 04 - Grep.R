
# Filtering values for entries containing "coal"
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
