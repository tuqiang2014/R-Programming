```
library(ggplot2)
diamonds
set.seed(1410)
dsmall<-diamonds[sample(nrow(diamonds),100),]
qplot(carat,price,data = diamonds)
qplot(log(carat),log(price),data = diamonds)
qplot(carat,x*y*z,data = diamonds)
qplot(carat,price,data = dsmall,color = color)
qplot(carat,price,data = dsmall,shape = cut)
qplot(carat,price,data = diamonds,alpha = I(1/100))
qplot(carat,price,data = diamonds,geom = c("point","smooth"))
qplot(carat,price,data = dsmall,geom = c("point","smooth"),
      span = 0.2)
library(mgcv)
install.packages("mgcv")
install.packages("nlme")
install.packages("MASS")
library(MASS)
qplot(color,price/carat,data = diamonds,geom = "jitter", alpha = I(1/50))
qplot(carat,,data = diamonds,geom = "density", color = color)
qplot(carat,,data = diamonds,geom = "histogram", fill = color)
qplot(color, data = diamonds, geom = "bar",weight = carat) +
  scale_y_continuous("carat")
qplot(date,unemploy/pop,data = economics,geom = "line")
year <- function(x) as.POSIXlt(x)$year + 1900
qplot(unemploy/pop,uempmed,data = economics,
      geom = c("point","path"))
qplot(unemploy/pop,uempmed,data = economics,
      geom = "path",colour = year(date))

qplot(carat, data = diamonds, facets = color ~ .,
      geom = "histogram", binwidth = 0.1,xlim = c(0,3)) 
qplot(carat, ..density..,data = diamonds, facets = color ~ .,
      geom = "histogram", binwidth = 0.1,xlim = c(0,3)) 

###########################################################
第三章
qplot(displ,hwy,data = mpg,color = factor(cyl))
```
