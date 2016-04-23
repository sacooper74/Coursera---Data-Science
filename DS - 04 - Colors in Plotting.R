# The default colors suck (col 1, 2, 3 black, red, green)
plot(rnorm(10), rnorm(10), col = c(1,2,3), pch = 19, lwd = 12)

# colors are not always obvious
# heat.colors() red low, white high
# topo.colors() blue low, green high

# grDevices
# names and numbers of colors
colors()

# colorRamp 
pal <- colorRamp(c("red", "blue"))
# first extreme; red
pal(0)
pal(1)
# in the middle
pal(.5)

# you can pass a sequence to pal
pal(seq(0,1, len = 10))

# colorRampPalette is similar, but takes integer arguments, returning a character vector in hexadecimal
pal <- colorRampPalette(c("red", "yellow"))
pal(2)
# 10 characters vectors between red and yellow
pal(10)

# RColorBrewer gives you more options
install.packages("RColorBrewer")
library(RColorBrewer)
# 2 arguments - numer of colors and the name of the pallette (look in the help page for brewer.pal)
cols <- brewer.pal(3, "BuGn")
# it returns hexadecimal
cols
# pass the colors into the color ramp palette
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

# the smoothScatter function also uses colors well - it ensures we don't just get a mess of points - it's a 
# 2D histogram with default blues palette in RColorBrewer palette
x <- rnorm(1000)
y <- rnorm(1000)
smoothScatter(x, y)

# use transparency for high-density plots - this is controlled in rgb() with the alpha parameter (e.g. 0.2)
plot(x, y, col=rgb(0,0,0,0.2), pch = 19)
