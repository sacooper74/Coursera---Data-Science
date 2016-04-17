# typical Lattice call - xyplot(y ~ x | f * g, data)
xyplot(Ozone~Wind, airquality)
xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")

# multipanel plots
xyplot(Ozone ~ Wind | as.factor(Month), data = airquality, layout = c(5,1))

# you can save Lattice objects to an object and use, for example names() to see the properties

# colors
sample(colors(), 10)

# leaving and rejoining swirl
play()
nxt()

library(ggplot2)
str(mpg)

# simplest plot - x, y and data
qplot(displ, hwy, data = mpg)

# modify aesthetics
qplot(displ, hwy, data = mpg, col = drv, geom = c("point", "smooth"))
qplot(displ, hwy, data = mpg, shape = drv)

# single variable histogram
qplot(hwy, data = mpg, fill = drv)
qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)
qplot(hwy, data = mpg, col = drv, geom = "density")

# Facets are like panels in Lattice - use the tilde to indicate number of rows
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data = mpg, facets = drv~.)

# boxplots, with color
qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacturer)

# part 2
# qplot doesn't reveal the underlying infrastructure of ggplot, these are basic fundamentals
# verb - noun - adjectives
# you can build layers; plot the data, overlay summary, metadata and annotation
qplot(displ, hwy, data = mpg, facets = .~drv, geom = c("point", "smooth"))
# initial call to ggplot
g <- ggplot(mpg, aes(displ, hwy))
# summary of g
summary(g)
# add geom point layer - with auto print (or save to object too)
g + geom_point()
# add another layer - smoother
g + geom_point() + geom_smooth()
# change default for smooth from "low s" due to noise, to linear regression line (less flexible, but sense of the trend)
g + geom_point() + geom_smooth(method = "lm")
# another layer - facets
g + geom_point() + geom_smooth(method = "lm") + facet_grid(. ~drv)
# ggplot requirest that data has good labels as they show on the graphs
# annotation
# points with constant values and alpha transparency
g + geom_point(color = "steelblue", size = 4, alpha = 1/2)
# points with data variable - you need to use aesthetics function (aes) for this
g + geom_point(aes(color = drv), size = 4, alpha = 1/2)
# add labels
g + geom_point(aes(color = drv), size = 4, alpha = 1/2) + labs(title = "play")
g + geom_point(aes(color = drv)) + labs(title = "Swirl Rules!") + labs(x = "Displacement", y = "Hwy Mileage")
# customize the smooth, with no confidence interval
g + geom_point(aes(color = drv), size = 4, alpha = 1/2) + labs(title = "play") + geom_smooth(method = "lm", size = 4, linetype = 3, se = F)
# change the theme
g + geom_point(aes(color = drv), size = 4, alpha = 1/2) + labs(title = "play") + theme_bw()
# use axis limits to remove outliers, but be careful not to just remove the points - coord_cartesian
# base plot function does this automatically
plot(myx, myy, type = "l", ylim=c(-3,3))
# in gg, you need:
g + geom_line() + coord_cartesian(ylim = c(-3,3))
# use the cut() function to cut continuous variables into ranges in order to use as facets
cutpoints <- quantile(diamonds$carat, seq(0, 1, length=4), na.rm = TRUE)

# can store to an object for future use when you can add more layers
h <- g + geom_point(aes(color = drv), size = 4, alpha = 1/2) + labs(title = "play") + theme_bw()
summary(h)

# you can add a totals panel with margins
g + geom_point() + facet_grid(drv~cyl, margins = TRUE)

# play with my own data set
head(Forbes2000)
qplot(sales, profits, data = Forbes2000, col = category)