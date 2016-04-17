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