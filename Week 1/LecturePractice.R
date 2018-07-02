# Five Number summary(actually 6)
summary(mtcars$mpg)

# Boxplot 
boxplot(mtcars$mpg, col="blue")

# Histogram
hist(mtcars$mpg, col="green")
rug(mtcars$mpg) # PLots all the points below the histogram

hist(mtcars$mpg, col="green", breaks=50)
rug(mtcars$mpg) # PLots all the points below the histogram

# Overlaying Features 
boxplot(mtcars$mpg, col="blue")
abline(h = 23)

hist(mtcars$mpg, col="green", breaks=50)
abline(v=20,lwd=2)
abline(v = median(mtcars$mpg), col="magenta",lwd = 4)

# Barplot
barplot(table(mtcars$cyl), col="wheat", main ="Number of cars categorized by cylinder count")

# Multiple box plots
boxplot(mpg ~ cyl,data = mtcars, col="red")

# Multiple Histograms
par(mfrow = c(3,1), mar = c(4,4,2,1))
hist(subset(mtcars, cyl == 8)$mpg, col="green")
hist(subset(mtcars, cyl == 6)$mpg, col="green")
hist(subset(mtcars, cyl == 4)$mpg, col="green")

par(mfrow = c(1,1))
# Scatterplot
with(mtcars, plot(hp,qsec, col=cyl))
abline(h = 12,lwd = 2, lty = 2)

par(mfrow = c(1,3), mar = c(5,4,2,1))
with(subset(mtcars, cyl == 8), plot(hp,qsec, main="Cyl - 8"))
with(subset(mtcars, cyl == 6), plot(hp,qsec, main="Cyl - 6"))
with(subset(mtcars, cyl == 4), plot(hp,qsec, main="Cyl - 4"))

### Plotting Systems

## Base Plotting System
library(datasets)
data(cars)
with(cars, plot(speed,dist))

## Lattice Plotting System
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

## ggplot2 system
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

## Base Plotting System
library(datasets)
hist(airquality$Ozone)

with(airquality, plot(Wind,Ozone))

airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone(ppb)")

par("lty")
par("bg")
par("las")
par("mfrow")
par("mar")

library(datasets)
with(airquality, plot(Wind,Ozone))
title(main = "Ozone and Wind in New York City")

with(airquality, plot(Wind,Ozone,main = "Ozone and Wind in New York City", type="n"))
with(subset(airquality, Month == 5), points(Wind,Ozone, col="blue"))
with(subset(airquality, Month != 5), points(Wind,Ozone, col="red"))
legend("topright", pch = 1, col = c("blue","red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind,Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone~Wind, airquality)     
abline(model, lwd = 2)

par(mfrow = c(1,2))
with(airquality, {
        plot(Wind,Ozone, main="Ozone and Wind")
        plot(Solar.R,Ozone, main="Ozone and Solar Radiation")
})


par(mfrow = c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(airquality, {
        plot(Wind,Ozone, main="Ozone and Wind")
        plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
        plot(Temp,Ozone, main="Ozone and Temperature")
        mtext("Ozone and Weather in the New York City", outer = TRUE)
})

par(mfrow=c(1,1))

x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x,y)
z <- rnorm(100)
plot(x,z)

par(mar = c(4,4,2,2))
plot(x,y)
plot(x,y, pch = 20)
plot(x,y, pch = 19)
plot(x,y, pch = 3)
plot(x,y, pch = 2)
plot(x,y, pch = 4)
example(points)

plot(x,y, pch = 21, col="blue", bg="red")

plot(x,y, pch = 20)
title("Scatterplot")
text(-2,-2,"Label")
legend("topleft", legend = "Data", pch = 20)
Fit <- lm(y ~ x)
abline(Fit)
abline(Fit, lwd=3, col="blue")
plot(x,y, xlab= "Weight", ylab="Height", main="Scatterplot", pch = 20)
legend("topright", pch = 20, legend = "Data")
fit <- lm(y~x)
abline(fit, lwd = 3, col="red")

z <- rpois(100,2)
par(mfrow = c(2,1))
plot(x,y, pch = 20)
plot(x,z, pch = 19)
par("mar")
par(mar = c(2,2,1,1))
plot(x,y, pch = 20)
plot(x,z, pch = 19)
par(mfrow=c(1,2))
par(mar=c(4,4,2,2))
plot(x,y, pch = 20)
plot(x,z, pch = 19)
par(mfrow=c(2,2))
plot(x,y)
plot(x,z)
plot(z,x)
plot(y,x)
par(mfcol=c(2,2))
plot(x,y)
plot(x,z)
plot(z,x)
plot(y,x)
par(mfrow=c(1,1))

x <- rnorm(100)
y <- x + rnorm(100)
g <-  gl(2, 50, labels = c("Male","Female"))
str(g)
plot(x,y)

plot(x,y,type="n")
points(x[g == "Male"],y[g=="Male"], col="green")
points(x[g == "Female"], y[g== "Female"], col="red", pch = 19)

# Creating plots on file devices
pdf(file="myplot.pdf")
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")
dev.off()

# Copying plots to a file
library(datasets)
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")
dev.copy(png,file="geyserplot.png")
dev.off()
dev.copy(jpeg,file="geyserplot.jpeg")
dev.off()
dev.copy(pdf,file="geyserplot.pdf")
dev.off()

library(swirl)
install_from_swirl("Exploratory Data Analysis")
swirl()

boxplot(Ozone~Month,airquality)
