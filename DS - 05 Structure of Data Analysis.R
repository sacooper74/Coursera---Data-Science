# Get the dataset for spam
# Install kernlab package
install.packages("kernlab")
library(kernlab)
data(spam)

# Perform subsampling
set.seed(3435)
trainIndicator = rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)

trainSpam = spam[trainIndicator == 1,]
testSpam = spam[trainIndicator == 0,]

# Exploratory analysis
# Look at summaries
names(trainSpam)
head(trainSpam)
table(trainSpam$type)

# Check for missing

# Exploratory plots
plot(trainSpam$capitalAve ~ trainSpam$type)
# Take the log and you'll see that there is higher incidence of capital letters in spam emails
plot(log10(trainSpam$capitalAve +1) ~ trainSpam$type)
# Pairwise relationships
plot(log10(trainSpam[,1:4]+1))

# Exploratory analysis
# hierarchical cluster analysis
hCluster = hclust(dist(t(trainSpam[,1:57])))
plot(hCluster)
# Clustering can be sensitive to skewness in the variables - sotake the log
hClusterUpdated = hclust(dist(t(log10(trainSpam[,1:57]+1))))
plot(hClusterUpdated)
