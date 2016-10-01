# Hierarchical clustering - example
# set the seed to ensure reproducibility
set.seed(1234)
par(mar = c(4,4,4,4))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x,y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

# Run the hierarchical clustering algorithm
# First, calculate the pairwise distances between all the different points
dataFrame <- data.frame(x = x, y = y)
# dist() defaults to euclidean
distxy <- dist(dataFrame)

hClustering <- hclust(distxy)
# create the dendogram to see how the points are merged together
plot(hClustering)

# use heatmap() for visualizing matrix data (large matrix / table) to look at the data in an organized (clustered) way
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)

# Run k-means clustering
# First, calculate the pairwise distances between all the different points
dataFrame <- data.frame(x, y)
# Run k-means with a specific number of centers
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
kmeansObj$cluster
kmeansObj$centers

# you can plot the result of k-means
par(mar = rep(4, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, lwd = 3)

# you can also use heatmap()

# Dimension Reduction
# Create a noisy, random matrix
set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[,nrow(dataMatrix):1])

# We can then run a hierarchical analysis on the rows
par(mar = rep(0.2, 4))
# You can see cluster analysis, no real interesting pattern
heatmap(dataMatrix)

# So, we add a pattern to the dataset
set.seed(678910)
# loop through rows, on a random row, if the coin is a 1, apply a pattern
for (i in 1:40) {
  # flip a coin
  coinFlip <- rbinom(1, size = 1, prob = 0.5)
  # if coin is heads, add a common pattern to that row
  if (coinFlip) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,3), each = 5)
  }
}

# repeat the heatmap

# Find the % of fields that are NA
mean(is.na(x0))

# Boxplot with log10
boxplot(log10(x0), log10(x1))

