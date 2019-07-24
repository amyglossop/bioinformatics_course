---
title: "7BBG2016 Advanced Bioinformatics 2019 assessment"
author: "Amy Glossop 8798"
date: "24/07/2019"
output:
  html_document:
    keep_md: yes
---



# Task 1 - sum of integers between 5 and 55
Using the *sum()* function and *:* operator, write an expression in the code snippet to evaluate the sum of all integers between 5 and 55.

## R:

```r
print("Task 1")
```

```
## [1] "Task 1"
```

```r
sum(5:55)
```

```
## [1] 1530
```

# Task 2 - sumfun function - sum of integers between 5 and n where n = 10, 20 and 100
Write a function called *sumfun* with one input parameter, called n, that calculates the sum of all integers between 5 and n. Use the function to do the calculation for n = 10, n = 20, and n = 100 and present the results.

## R:

```r
print("Task 2")
```

```
## [1] "Task 2"
```

```r
# make sumfun function()
sumfun <- function(n) {
    sum(5:n)
    }
# calculation for n = 10, n = 20, and n = 100
sumfun(10)
```

```
## [1] 45
```

```r
sumfun(20)
```

```
## [1] 200
```

```r
sumfun(100)
```

```
## [1] 5040
```

# Task 3 - First 12 entries of Fibonacci series
The famous Fibonacci series is calculated as the sum of the two preceding members of the sequence, where the first two steps in the sequence are 1, 1. Write an R script using a for loop to calculate and print out the first 12 entries of the Fibonacci series

## R:

```r
print("Task 3")
```

```
## [1] "Task 3"
```

```r
# numeric vector of 12 named Task3
Task3 <- numeric(12)
# first two numbers of series are 1 and 1
Task3[1] <- 1
Task3[2] <- 1
# for loop for 3 to 12 of series so that each value is the sum of the previous two
for (i in 3:12) Task3[i] <- Task3[i-2] + Task3[i-1]
# print the entire series of 12 values
Task3
```

```
##  [1]   1   1   2   3   5   8  13  21  34  55  89 144
```

#  Task 4 - boxplot of mpg by number of gears
With the mtcars dataset bundled with R, use *ggplot* to generate a box plot of miles per gallon (in the variable *mpg*) as a function of the number of gears (in the variable *gear*). Tip: use the *as.factor* function to convert the gear variable from numeric into factor. For bonus point: use the fill aesthetic to colour bars by number of gears (Tip: see ggplot2 cheat sheet at RStudio.com for different ggplot options).

## R:

```r
print("Task 4")
```

```
## [1] "Task 4"
```

```r
# load ggplot2 using library(ggplot2)
library(ggplot2)

# ggplot
data(mtcars)
mtcars$gear <- as.factor(mtcars$gear)
ggplot(mtcars,aes(x=gear,y=mpg, fill=gear))+geom_boxplot()
```

![](7BBG2016_Advanced_Bioinformatics_R_files/figure-html/unnamed-chunk-4-1.png)<!-- -->
```

# Task 5 = model fitting between speed and breaking distance
Using the *cars* dataset and the function *lm*, fit a linear relationship between *speed* (in units of mph) and breaking distance (in units of feet) in the variable *dist*. What are fitted slope and intercept of the line, and their standard deviations?

## R:

```r
print("Task 5")
```

```
## [1] "Task 5"
```

```r
# set x and y
y <- cars$dist
x<- cars$speed

# Linear model lm()
model <- lm(formula="y~x")
model
```

```
## 
## Call:
## lm(formula = "y~x")
## 
## Coefficients:
## (Intercept)            x  
##     -17.579        3.932
```

```r
# summary() 
summary(model)
```

```
## 
## Call:
## lm(formula = "y~x")
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -29.069  -9.525  -2.272   9.215  43.201 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -17.5791     6.7584  -2.601   0.0123 *  
## x             3.9324     0.4155   9.464 1.49e-12 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.38 on 48 degrees of freedom
## Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
## F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
```

- The Slope (speed) is 3.932  

- The (Intercept) is -17.597

From the Estimate and Std. Error columns in the summary output, the standard deviations or Std. Errors are:  

- Slope Std. Error = 0.4155  
- Intercept Std. Errrors = 6.7584


# Task 6
Use ggplot to plot the data points from Question 5 and the linear fit.

## R:

```r
print("Task 6")
```

```
## [1] "Task 6"
```

```r
# Use ggplot to plot the data points from Task 5 and the linear fit.
ggplot(cars,aes(speed,dist)) + 
    geom_point() + 
    geom_smooth(method="lm",formula="y~x")
```

![](7BBG2016_Advanced_Bioinformatics_R_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

# Task 7
Again using the cars dataset, now use linear regression (*lm*) to estimate the average reaction time for the driver to start breaking (in seconds). To simplify matters you may assume that once breaking commences, breaking distance is proportional to the square of the speed. You may also use that 1 mile = 5280 feet and 1h = 3600 seconds. Note that you'll need to use the *I()* function in the regression formula to make sure any non-linear terms gets treated literally, rather than as combinations of factors (e.g. *I(x^2)* for a term quadratic in the variable x). Do you get reasonable results? Finally, use ggplot to plot the data points and the fitted relationship.

## R:


```r
print("Task 7")
```

```
## [1] "Task 7"
```

```r
# change units of speed to ft/second in order to estimate reaction time in seconds
cars$speedconverted <- cars$speed * (5280/3600)

# set x and y
y <- cars$dist
x <- cars$speedconverted

# linear model: fit quadratic formula with zero offset
modeltaskseven <- lm(y~0+x+I(x^2))
summary(modeltaskseven)
```

```
## 
## Call:
## lm(formula = y ~ 0 + x + I(x^2))
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -28.836  -9.071  -3.152   4.570  44.986 
## 
## Coefficients:
##        Estimate Std. Error t value Pr(>|t|)   
## x       0.84479    0.38180   2.213  0.03171 * 
## I(x^2)  0.04190    0.01366   3.067  0.00355 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.02 on 48 degrees of freedom
## Multiple R-squared:  0.9133,	Adjusted R-squared:  0.9097 
## F-statistic: 252.8 on 2 and 48 DF,  p-value: < 2.2e-16
```

The estimated reaction delay is 0.84475 seconds. (Reasonable result)

plot


```r
# ggplot to plot data points and fitted relationship
ggplot(cars,aes(x=speedconverted, y=dist)) + 
    geom_point() + 
    geom_smooth(method="lm", formula="y~0+x+I(x^2)")
```

![](7BBG2016_Advanced_Bioinformatics_R_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


