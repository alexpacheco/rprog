---
title       : Programming in R
subtitle    : A short introduction
author      : Alex Pacheco
job         : LTS Research Computing
logo        : lu.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
--- .rcr

## Read-And-Delete

1. Edit YAML front matter
2. Write using R Markdown
3. Use an empty line followed by three dashes to separate slides!

--- .rcr

## History

* R is a dialect of the S language
    - S was initiated at the Bell Labs as an internal statistical analysis environment.
    - Most well known implementation is S‐plus (most recent stable release was in 2010)
* R was first announced in 1993.
* The R core group was formed in 1997, who controls the source code of R (written in C)
* R 1.0.0 was released in 2000
* The current version is 3.2.2

--- .rcr


## Features

- R is a dialect of the S language
    - Language designed for statistical analysis
    - Similar syntax
- Available on most platform/OS
- Rich data analysis functionalities and sophisticated graphical capabilities
- Active development and very active community
    - CRAN: The Comprehensive R Archive Network
- Source code and binaries, user contributed packages and documentation
    - More than 6,000 packages available on CRAN as of last week
- Free to use

--- .rcr

## Alternatives to R

* __S-PLUS__: commercial verison of S
* __Gretl__: open-source statistical package, mainly for econometrics
* __SPSS__: widely used program for statistical analysis in social science
* __PSPP__: free alternative to SPSS
* __SAS__: proprietary software that can be used with very large datasets such as census data
* __STATA__: proprietary software that is often used in economics and epidemiology
* __MATLAB__: proprietary software used widely in the mathematical sciences and engineering
* __GNU Octave__: free alternative to MATLAB
* __Python__: general programming language

--- .rcr 

## Installing R

* R can be installed on Windows, Mac OSX and Linux from [CRAN](https://cran.r-project.org/mirrors.html).

<img src="./R-GUI.PNG" height="500px" width="800px" alt="R GUI" />


--- .rcr

## Running R

* [RStudio](https://www.rstudio.com/) is the most popular (de facto) environment for running R on all platforms.
* From Command Line on *NIX
   - Enter `R` on the command line (if you have modified your `PATH` correctly)
* Batch Mode on *NIX
   - Use the `Rscript filename.R` command to execute commands from a file, `filename.R` 


```sh
cat hello.R
```

```
## Error in running command sh
```

```sh
Rscript hello.R
```

```
## Error in running command sh
```

--- .rcr

## RStudio

* free and open source IDE for R. Can be installed on Windows, Mac OSX and Linux.
* user interface comparable to other IDEs or software such as MATLAB.
* more suited for development 

<img src="./RStudio.PNG" height="400px" width="800px" alt="RStudio" />

--- .rcr

## Get Started with R

* Use the console to use R as a simple calculator


```r
1+2
```

```
## [1] 3
```

* The assignment symbol is "<-". The classical "=" symbol can also be used


```r
a=2+3
b<-10/a
a
```

```
## [1] 5
```

```r
b
```

```
## [1] 2
```

--- .rcr

## Get Started with R

* install packages from CRAN, for e.g. knitr


```r
install.packages('knitr')
```

* load a library, for e.g. knitr


```r
library(knitr)
```

* Help from command line

```
?<command name>
??<part of command name/topic>
```

* or search in the help page in RStudio

* `getwd()`: display current working directory

* `setwd('dir')`: change current working director to `dir`

--- .rcr

## Data Classes

* R has five atomic classes
* Numeric
    - Double is equivalent to numeric.
    - Numbers in R are treated as numeric unless specified otherwise.
* Integer
* Complex
* Character
* Logical
    - TRUE or FALSE
* You can convert data from one type to the other using the `as.<Type>` functions
* To check the class of an object, use the `is.<Type>` function.

--- .rcr

## Example


```r
a <- 3
b <- sqrt(a)
b
```

```
## [1] 1.732051
```

```r
c <- 2i
d <- TRUE
d
```

```
## [1] TRUE
```

```r
as.numeric(d); as.character(b); is.complex(c)
```

```
## [1] 1
```

```
## [1] "1.73205080756888"
```

```
## [1] TRUE
```

--- .rcr


## Data Objects‐ Vectors

* Vectors can only contain elements of the same class
* Vectors can be constructed by
    -  Using the `c()` function (concatenate)
* Coercion will occur when mixed objects are passed to the `c()` function, as if the `as.<Type>()` function is explicitly called
    -  Using the `vector()` function
* One can use `[index]` to access individual element
    -  Indices start from 1

--- .rcr

## Examples


```r
# "#" indicates comment
# "<-" performs assignment operation (you can use "=" as well, but "<-" is preferred)
# numeric (double is the same as numeric)
d <- c(1,2,3)
# character
d <- c("1","2","3")
# you can covert at object with as.TYPE
# as. numeric changes the character vector created above to numeric
as.numeric(d)
```

```
## [1] 1 2 3
```

```r
# The conversion doesn't always work though
as.numeric("a")
```

```
## Warning: NAs introduced by coercion
```

```
## [1] NA
```

--- .rcr

## Examples (contd)


```r
x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## logical
x <- c("a", "b", "c") ## character
# The ":" operator can be used to generate integer sequences
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex
x <- vector("numeric", length = 10)
# Coercion will occur when objects of different classes are mixed
y <- c(1.7, "a") ## character
y <- c(TRUE, 2) ## numeric
y <- c("a", TRUE) ## character
# Can also coerce explicitly
x <- 0:6
class(x)
```

```
## [1] "integer"
```

```r
as.logical(x)
```

```
## [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

--- .rcr


## Vectorized Operations

* Lots of R operations process objects in a vectorized way
    -  more efficient, concise, and easier to read.


```r
x <- 1:4; y <- 6:9
x + y
```

```
## [1]  7  9 11 13
```

```r
x > 2
```

```
## [1] FALSE FALSE  TRUE  TRUE
```

```r
x * y
```

```
## [1]  6 14 24 36
```

```r
print( x[x >= 3] )
```

```
## [1] 3 4
```

--- .rcr


## Data Objects - Matrices

* Matrices are vectors with a dimension attribute
* R matrices can be constructed
    -  Using the `matrix()` function
	  - Passing an dim attribute to a vector
	  -  Using the `cbind()` or `rbind()` functions
* R matrices are constructed column‐wise
* One can use `[<index>,<index>]` to access individual element

--- .rcr


## Example

```r
# Create a matrix using the matrix() function
m <- matrix(1:6, nrow = 2, ncol = 3)
m
```

```
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
```

```r
dim(m)
```

```
## [1] 2 3
```

```r
attributes(m)
```

```
## $dim
## [1] 2 3
```

--- .rcr

## Example


```r
# Pass a dim attribute to a vector
m <- 1:10
m
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
dim(m) <- c(2, 5)
m
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
```

--- .rcr

## Example


```r
# Row binding and column binding
x <- 1:3
y <- 10:12
cbind(x, y)
```

```
##      x  y
## [1,] 1 10
## [2,] 2 11
## [3,] 3 12
```

```r
rbind(x, y)
```

```
##   [,1] [,2] [,3]
## x    1    2    3
## y   10   11   12
```

--- .rcr

## Example


```r
# Slicing
m
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
```

```r
# element at 2nd row, 3rd column
m[2,3]
```

```
## [1] 6
```

```r
# entire i<sup>th</sup> row of m
m[2,]
```

```
## [1]  2  4  6  8 10
```

```r
# entire j<sup>th</sup> column of m
m[,3]
```

```
## [1] 5 6
```

--- .rcr


## Data Objects - Lists

* Lists are a special kind of vector that contains objects of different classes
* Lists can be constructed by using the `list()` function
* Lists can be indexed using `[[  ]]`


```r
# Use the list() function to construct a list
x <- list(1, "a", TRUE, 1 + 4i)
x
```

```
## [[1]]
## [1] 1
## 
## [[2]]
## [1] "a"
## 
## [[3]]
## [1] TRUE
## 
## [[4]]
## [1] 1+4i
```

--- .rcr


## Data Objects - Data Frames
* Data frames are used to store tabular data
    -  They are a special type of list where every element of the list has to have the same length
    -  Each element of the list can be thought of as a column
    -  Data frames can store different classes of objects in each column
    -  Data frames also have a special attribute called `row.names`
    -  Data frames are usually created by calling `read.table()` or `read.csv()`
          -  More on this later
    -  Can be converted to a matrix by calling `data.matrix()`

--- .rcr


## Names

* R objects can have names


```r
# Each element in a vector can have a name
x <- 1:3
names(x)
```

```
## NULL
```

```r
names(x) <- c("a","b","c")
names(x)
```

```
## [1] "a" "b" "c"
```

```r
x
```

```
## a b c 
## 1 2 3
```

--- .rcr

## Names (contd)


```r
# Lists
x <- list(a = 1, b = 2, c = 3)
x
```

```
## $a
## [1] 1
## 
## $b
## [1] 2
## 
## $c
## [1] 3
```

```r
# Names can be used to refer to individual element
x$a
```

```
## [1] 1
```

--- .rcr

## Names (contd)


```r
# Columns and rows of matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
```

```
##   c d
## a 1 3
## b 2 4
```

--- .rcr


## Querying Object Attributes

* The `class()` function
* The `str()` function
* The `attributes()` function reveals attributes of an object (does not work with vectors)
    -  Class
    -  Names
    -  Dimensions
    -  Length
    -  User defined attributes
* They work on all objects (including functions)

--- .rcr

## Example


```r
m <- matrix(1:10, nrow = 2, ncol = 5)
str(matrix)
```

```
## function (data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
```

```r
str(m)
```

```
##  int [1:2, 1:5] 1 2 3 4 5 6 7 8 9 10
```

```r
str(str)
```

```
## function (object, ...)
```

--- .rcr


## Data Class - Factors

* Factors are used to represent categorical data.
* Factors can be unordered or ordered.
* Factors are treated specially by modelling functions like `lm()` and `glm()`


```r
# Use the factor() function to construct a vector of factors
# The order of levels can be set by the levels keyword
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x
```

```
## [1] yes yes no  yes no 
## Levels: yes no
```

--- .rcr


## Date and Time

* R has a Date class for date data while times are represented by POSIX formats
* One can convert a text string to date using the `as.Date()` function
* The `strptime()` function can deal with dates and times in different formats.
* The package "`lubridate`" provides many additional and convenient features


```r
# Dates are stored internally as the number of days since 1970-01-01
x <- as.Date("1970-01-01")
x
```

```
## [1] "1970-01-01"
```

```r
as.numeric(x)
```

```
## [1] 0
```

```r
x+1
```

```
## [1] "1970-01-02"
```

--- .rcr

## Data and Time (contd)


```r
# Times are stored internally as the number of seconds since 1970-01-01
x <- Sys.time() ; x
```

```
## [1] "2015-10-19 19:01:48 EDT"
```

```r
as.numeric(x)
```

```
## [1] 1445295708
```

```r
p <- as.POSIXlt(x)
names(unclass(p))
```

```
##  [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"  
##  [8] "yday"   "isdst"  "zone"   "gmtoff"
```

```r
p$sec
```

```
## [1] 48.14211
```

--- .rcr


## Missing Values

* Missing values are denoted by `NA` or `NaN` for undefined mathematical operations.
    - `is.na()` is used to test objects if they are `NA`
    - `is.nan()` is used to test for `NaN`
    - `NA` values have a class also, so there are integer `NA`, character `NA`, etc.
    - A `NaN` value is also `NA` but the converse is not true


```r
x <- c(1,2, NA, 10,3)
is.na(x)
```

```
## [1] FALSE FALSE  TRUE FALSE FALSE
```

```r
is.nan(x)
```

```
## [1] FALSE FALSE FALSE FALSE FALSE
```

--- .rcr

## Missing Values (contd)


```r
x <- c(1,2, NaN, NA,4)
is.na(x)
```

```
## [1] FALSE FALSE  TRUE  TRUE FALSE
```

```r
is.nan(x)
```

```
## [1] FALSE FALSE  TRUE FALSE FALSE
```

--- .rcr

## Arithmetic Functions

<table>
<tr><th>Function</th><th>Description</th></tr>   
<tr><td><code>exp()</code></td><td>     Exponentiation</td></tr>
<tr><td><code>log()</code></td><td>     Natural Logarithm</td></tr>
<tr><td><code>log10()</code></td><td>   Logarithm to base 10</td></tr>
<tr><td><code>sqrt()</code></td><td>    square root</td></tr>
<tr><td><code>abs()</code></td><td>     absolute value</td></tr>
<tr><td><code>sin()</code></td><td>     sine</td></tr>
<tr><td><code>cos()</code></td><td>     cosine</td></tr>
<tr><td><code>floor()</code></td><td>    </td></tr>
<tr><td><code>ceiling()</code></td><td> rounding of numbers</td></tr>
<tr><td><code>round()</code></td><td>   </td></tr>
</table>

--- .rcr

## Simple Statistic Functions

<table border="1">
<tr><th>Function</th><th>Description</th></tr>
<tr><td><code>min()</code></td><td>minimum value</td></tr>
<tr><td><code>max()</code></td><td>maximum value</td></tr>
<tr><td><code>which.min()</code></td><td>location of minimum</td></tr>
<tr><td><code>which.max()</code></td><td>location of maximum</td></tr>
<tr><td><code>pmin()</code></td><td>elementwise minima of several vectors</td></tr>
<tr><td><code>pmax()</code></td><td>elementwise maxima of several vectors</td></tr>
<tr><td><code>sum()</code></td><td>sum of elements of a vector</td></tr>
<tr><td><code>mean()</code></td><td>mean of elements of a vector</td></tr>
<tr><td><code>prod()</code></td><td>products of elements of a vector</td></tr>
</table>

--- .rcr


## Distributions and Random Variables

* For each distribution R provides four functions: density (`d`), cumulative density (`p`), quantile (`q`), and random generation (`r`)
    - The function name is of the form `[d|p|q|r]<name of distribution>`
    - e.g. `qbinom()` gives the quantile of a binomial distribution


<table>
<tr><th>Distribution</th><th>Distribution name in R</th></tr>
<tr><td>Uniform</td><td><code>unif</code></td></tr>
<tr><td>Binomial</td><td><code>binom</code></td></tr>
<tr><td>Poisson</td><td><code>pois</code></td></tr>
<tr><td>Geometric</td><td><code>geom</code></td></tr>
<tr><td>Gamma</td><td><code>gamma</code></td></tr>
<tr><td>Normal</td><td><code>norm</code></td></tr>
<tr><td>Log Normal</td><td><code>lnorm</code></td></tr>
<tr><td>Exponential</td><td><code>exp</code></td></tr>
<tr><td>Student’s t</td><td><code>t</code></td></tr>
</table>

--- .rcr

## Examples: Distributions and Random Variables


```r
# Random generation from a uniform distribution.
runif(10, 2, 4)
```

```
##  [1] 2.026539 3.202648 2.287503 2.875370 2.742208 2.940982 2.100651
##  [8] 2.390579 2.285804 2.457612
```

```r
# You can name the arguments in the function call.
runif(10, min = 2, max = 4)
```

```
##  [1] 2.843830 3.842709 2.323027 3.076045 2.381622 2.450670 3.050875
##  [8] 3.613974 2.553782 2.357098
```

```r
# Given p value and degree of freedom, find the t-value.
qt(p=0.975, df = 8)
```

```
## [1] 2.306004
```

```r
# The inverse of the above function call
pt(2.306, df = 8)
```

```
## [1] 0.9749998
```

--- .rcr

## User Defined Functions
* Similar to other languages, functions in R are defined by using the `function()` directives
* The return value is the last expression in the function body to be evaluated.
* Functions can be nested
* Functions are R objects
    - For example, they can be passed as an argument to other functions


```r
newDef <- function(a,b)
 {
     x = runif(10,a,b)
     mean(x)
 }
newDef(-1,1)
```

```
## [1] -0.3336923
```

--- .rcr

## Control Structures
* Control structures allow one to control the flow of execution.

<table>
<tr><td><code>if … else</code></td><td>testing a condition</td></tr>
<tr><td><code>for</code></td><td>executing a loop (with fixed number of iterations)</td></tr>
<tr><td><code>while</code></td><td>executing a loop when a condition is true</td></tr>
<tr><td><code>repeat</code></td><td>executing an infinite loop</td></tr>
<tr><td><code>break</code></td><td>breaking the execution of a loop</td></tr>
<tr><td><code>next</code></td><td>skipping to next iteration</td></tr>
<tr><td><code>return</code></td><td>exit a function</td></tr>
</table>

--- .rcr


## Testing conditions


```r
# Comparisons: <,<=,>,>=,==,!=
# Logical operations: !, &&, ||
if(x > 3 && x < 5) {
  print ("x is between 3 and 5")
} else if(x <= 3) {
  print ("x is less or equal to 3")
} else {
  print ("x is greater or equal to 5")
}
```

--- .rcr

## For Loops


```r
x <- c("a", "b", "c", "d")
# These loops have the same effect
# Loop through the indices
for(i in 1:4) {
  print(x[i])
}
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

```r
# Loop using the seq_along() function
for(i in seq_along(x)) {
  print(x[i])
}
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

--- .rcr

## For Loops (contd)


```r
# Loop through the name
for(letter in x) {
  print(letter)
}
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

```r
for(i in 1:4) print(x[i])
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

--- .rcr &twocol

## while loops

* The `while` loop can be used to repeat a set of instructions
* It is often used when you do not know in advance how often the instructions will be executed. 
* The basic format for a `while` loop is `while(cond) expr`

*** =left


```r
sum <- 1
while ( sum < 11 )
{
  sum <- sum + 2;
  print(sum);
}
```

```
## [1] 3
## [1] 5
## [1] 7
## [1] 9
## [1] 11
```

*** =right


```r
sum <- 12
while (sum < 11 ) 
{
  sum <- sum + 2;
  print(sum);
}
```

--- .rcr &twocol

## repeat loops

* The `repeat` loop is similar to the `while` loop. 
* The difference is that it will always begin the loop the first time. The `while` loop will only start the loop if the condition is true the first time it is evaluated. 
* Another difference is that you have to explicitly specify when to stop the loop using the `break` command.

*** =left


```r
sum <- 1
repeat
{
  sum <- sum + 2;
  print(sum);
  if (sum > 11)
    break;
}
```

```
## [1] 3
## [1] 5
## [1] 7
## [1] 9
## [1] 11
## [1] 13
```

*** =right


```r
sum <- 12
repeat
{
  sum <- sum + 2;
  print(sum);
  if (sum > 11)
    break;
}
```

```
## [1] 14
```

--- .rcr

## break and next statements

* The `break` statement is used to stop the execution of the current loop. 
  - It will break out of the current loop. 
* The `next` statement is used to skip the statements that follow and restart the current loop. 
  - If a `for` loop is used then the `next` statement will update the loop variable.


```r
x <- rnorm(5)
for(lupe in x)
 {
     if (lupe > 2.0)
         next

     if( (lupe<0.6) && (lupe > 0.5))
        break

    cat("The value of lupe is ",lupe,"\n");
 }
```

```
## The value of lupe is  -0.7924304 
## The value of lupe is  1.26121 
## The value of lupe is  -0.2861946 
## The value of lupe is  0.7631597
```


--- .rcr

## The apply Function
* The `apply()` function evaluate a function over
the margins of an array
    - More concise than the for loops (not necessarily
faster)


```r
# X: array objects
# MARGIN: a vector giving the subscripts which the function will be applied over
# FUN: a function to be applied
str(apply)
```

```
## function (X, MARGIN, FUN, ...)
```

```r
x <- matrix(rnorm(200), 20, 10)
# Row means
apply(x, 1, mean)
```

```
##  [1] -0.02980425  0.47548479 -0.17200289  0.29934028  0.33317126
##  [6] -0.20054338 -0.80790331  0.33250847  0.01453072  0.01301510
## [11] -0.29130371  0.30378519  0.67118535 -0.07571641 -0.45777843
## [16] -0.76566242 -0.02117571  0.78993267  0.19223683 -0.19176820
```

--- .rcr

## The apply Function (contd)


```r
# Column sums
apply(x, 2, sum)
```

```
##  [1] -0.02534246  6.46688423  6.87821104  4.21364080 -5.07335133
##  [6] -4.22536266 -2.94363205  9.20242555 -8.94934550 -1.42880822
```

```r
# 25th and 75th Quantiles for rows
apply(x, 1, quantile, probs = c(0.25, 0.75))
```

```
##           [,1]       [,2]       [,3]       [,4]       [,5]       [,6]
## 25% -0.5852953 -0.2502379 -0.5591040 -0.1284328 0.07684569 -0.9370579
## 75%  0.4471409  1.5952261  0.2812745  0.7407350 0.66094084  0.2270838
##           [,7]        [,8]       [,9]      [,10]      [,11]      [,12]
## 25% -1.8464673 -0.06135118 -0.6084780 -0.9351408 -1.0011511 -0.4155871
## 75%  0.2220165  0.74125005  0.3117197  0.6225775  0.1560855  0.6714949
##         [,13]      [,14]       [,15]      [,16]      [,17]     [,18]
## 25% 0.2705827 -0.4997581 -0.77269909 -1.4574850 -0.7246913 0.2667282
## 75% 1.2450816  0.3535057 -0.04648773 -0.1717755  0.5150988 1.2046843
##          [,19]      [,20]
## 25% -0.1943826 -0.4762104
## 75%  0.9408079  0.5704878
```

--- .rcr

## The apply Function (contd)


```r
dim(x)
```

```
## [1] 20 10
```

```r
# Change the dimensions of x
dim(x) <- c(2,2,50)
# Take average over the first two dimensions
apply(x, c(1, 2), mean)
```

```
##           [,1]         [,2]
## [1,] 0.1935815 -0.307350301
## [2,] 0.2004346 -0.004359337
```

```r
rowMeans(x, dims = 2)
```

```
##           [,1]         [,2]
## [1,] 0.1935815 -0.307350301
## [2,] 0.2004346 -0.004359337
```

--- .rcr

## Other Apply Functions
* `lapply`: Loop over a list and evaluate a function on each element
* `sapply`: Same as lapply but try to simplify the result
* `tapply`: Apply a function over subsets of a vector
* `mapply`: Multivariate version of lapply

--- .rcr

## Plyr Package
* In data analysis you often need to 
    - split up a big data structure into homogeneous pieces,
    - apply a function to each piece and then
    - combine all the results back together
* This split‐apply‐combine procedure is what
the `plyr` package is for.

--- .rcr

## Example: Plyr Package


```r
library(ggplot2)
library(plyr)
str(mpg)
```

```
## 'data.frame':	234 obs. of  11 variables:
##  $ manufacturer: Factor w/ 15 levels "audi","chevrolet",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ model       : Factor w/ 38 levels "4runner 4wd",..: 2 2 2 2 2 2 2 3 3 3 ...
##  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
##  $ year        : Factor w/ 2 levels "1999","2008": 1 1 2 2 1 1 2 1 1 2 ...
##  $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
##  $ trans       : Factor w/ 10 levels "auto(av)","auto(l3)",..: 4 9 10 1 4 9 1 9 4 10 ...
##  $ drv         : Factor w/ 3 levels "4","f","r": 2 2 2 2 2 2 2 1 1 1 ...
##  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
##  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
##  $ fl          : Factor w/ 5 levels "c","d","e","p",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ class       : Factor w/ 7 levels "2seater","compact",..: 2 2 2 2 2 2 2 2 2 2 ...
```

```r
str(ddply)
```

```
## function (.data, .variables, .fun = NULL, ..., .progress = "none", 
##     .inform = FALSE, .drop = TRUE, .parallel = FALSE, .paropts = NULL)
```

--- .rcr

## Example (contd)


```r
ddply(mpg, "cyl", summarise, mean = mean(cty))
```

```
##   cyl     mean
## 1   4 21.01235
## 2   5 20.50000
## 3   6 16.21519
## 4   8 12.57143
```

--- .rcr

## Reading and Writing Data
* R understands many different data formats and has lots of ways of reading/writing them

<table>
<tr><th>Funtion (read)</th><th>Function (write)</th><th>Description</th></tr>
<tr><td><code>read.table</code></td><td><code>write.table</code></td><td></td></tr>
<tr><td><code>read.csv</code></td><td><code>write.csv</code></td><td>reading/writing tabular data</td></tr>
<tr><td><code>readLines</code></td><td><code>writeLines</code></td><td>reading/writing lines of a text file</td></tr>
<tr><td><code>source</code></td><td><code>dump</code></td><td>reading/writing in R code files</td></tr>
<tr><td><code>dget</code></td><td><code>dput</code></td><td>reading/writing in R code files</td></tr>
<tr><td><code>load</code></td><td><code>save</code></td><td>reading in/saving workspaces</td></tr>
<tr><td><code>unserialize</code></td><td><code>serialize</code></td><td>reading/writing single R objects in binary form</td></tr>
</table>

--- .rcr

## Reading Data with read.table


```r
str(read.table)
```

```
## function (file, header = FALSE, sep = "", quote = "\"'", dec = ".", 
##     numerals = c("allow.loss", "warn.loss", "no.loss"), row.names, 
##     col.names, as.is = !stringsAsFactors, na.strings = "NA", colClasses = NA, 
##     nrows = -1, skip = 0, check.names = TRUE, fill = !blank.lines.skip, 
##     strip.white = FALSE, blank.lines.skip = TRUE, comment.char = "#", 
##     allowEscapes = FALSE, flush = FALSE, stringsAsFactors = default.stringsAsFactors(), 
##     fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)
```

* `file` ‐ the name of a file, or a connection
* `header` ‐ logical indicating if the file has a header line
* `sep` ‐ a string indicating how the columns are separated
* `colClasses` ‐ a character vector indicating the class of each column in the dataset
* `nrows` ‐ the number of rows in the dataset
* `comment.char` ‐ a character string indicating the comment character
* `skip` ‐ the number of lines to skip from the beginning
* `stringsAsFactors` ‐ should character variables be coded as factors?

--- .rcr

## Reading Data with read.table (contd)

* The function will
    - Skip lines that begin with a #
    - Figure out how many rows there are (and how much memory needs to be allocated)
    - Figure out what type of variable is in each column of the table
* Telling R all these things directly makes R run faster and more efficiently.
* `read.csv()` is identical to `read.table()` except that the default separator is a comma.

--- .rcr

## Graphics in R
* There are three plotting systems in R
    - Base
* Convenient, but hard to adjust after the plot is created
    - Lattice
* Good for creating conditioning plot
    - Ggplot2
* Powerful and flexible, many tunable feature, may require some time to master
* Each has its pros and cons, so it is up to the users which one to choose

--- .rcr

## Graphics - Base

```r
summary(mpg)
```

```
##      manufacturer                 model         displ         year    
##  dodge     :37    caravan 2wd        : 11   Min.   :1.600   1999:117  
##  toyota    :34    ram 1500 pickup 4wd: 10   1st Qu.:2.400   2008:117  
##  volkswagen:27    civic              :  9   Median :3.300             
##  ford      :25    dakota pickup 4wd  :  9   Mean   :3.472             
##  chevrolet :19    jetta              :  9   3rd Qu.:4.600             
##  audi      :18    mustang            :  9   Max.   :7.000             
##  (Other)   :74    (Other)            :177                             
##       cyl               trans    drv          cty             hwy       
##  Min.   :4.000   auto(l4)  :83   4:103   Min.   : 9.00   Min.   :12.00  
##  1st Qu.:4.000   manual(m5):58   f:106   1st Qu.:14.00   1st Qu.:18.00  
##  Median :6.000   auto(l5)  :39   r: 25   Median :17.00   Median :24.00  
##  Mean   :5.889   manual(m6):19           Mean   :16.86   Mean   :23.44  
##  3rd Qu.:8.000   auto(s6)  :16           3rd Qu.:19.00   3rd Qu.:27.00  
##  Max.   :8.000   auto(l6)  : 6           Max.   :35.00   Max.   :44.00  
##                  (Other)   :13                                          
##  fl             class   
##  c:  1   2seater   : 5  
##  d:  5   compact   :47  
##  e:  8   midsize   :41  
##  p: 52   minivan   :11  
##  r:168   pickup    :33  
##          subcompact:35  
##          suv       :62
```

--- .rcr

## Graphics - Base (contd)


```r
plot(hwy ~ displ, data=mpg)
```

![plot of chunk unnamed-chunk-42](assets/fig/unnamed-chunk-42-1.png) 

--- .rcr

## Graphics - Base (contd)


```r
boxplot(hwy ~ class, data = mpg, xlab = "Class", ylab = "High Way Mileage")
```

![plot of chunk unnamed-chunk-43](assets/fig/unnamed-chunk-43-1.png) 

--- .rcr

## Graphics - Lattice


```r
mpg <- transform(mpg, year = factor(year)) 
xyplot(hwy ~ displ | year*drv, mpg, layout = c(6,1))
```

![plot of chunk unnamed-chunk-44](assets/fig/unnamed-chunk-44-1.png) 

--- .rcr

## Graphics - ggplot2

```r
qplot(displ, cty, data = mpg, color = drv)
```

![plot of chunk unnamed-chunk-45](assets/fig/unnamed-chunk-45-1.png) 

--- .rcr

## Graphics - ggplot2

```r
qplot(displ, hwy, data = mpg, facets = drv ~ year)
```

![plot of chunk unnamed-chunk-46](assets/fig/unnamed-chunk-46-1.png) 


```r
ggplot(emiByType, aes(year, sum, colour = type)) +
 geom_point(size = 5) +
 geom_line(size = 1) +
 ggtitle("Total Emission in Baltimore City by Source Type") +
 labs(x = "Year", y = "Total Emissions (ton)", fontsize = 20) +
 theme_economist() + scale_colour_economist() +
 theme(axis.title=element_text(size=14,face="bold"), legend.title =
   element_text(size = rel(1.5), face = "bold"))
```

--- .rcr &twocol

## Histograms

*** =left


```r
library(RColorBrewer)
data(VADeaths)
par(mfrow=c(2,3))
hist(VADeaths,breaks=10, col=brewer.pal(3,"Set3"),main="Set3 3 colors")
hist(VADeaths,breaks=3 ,col=brewer.pal(3,"Set2"),main="Set2 3 colors")
hist(VADeaths,breaks=7, col=brewer.pal(3,"Set1"),main="Set1 3 colors")
hist(VADeaths,,breaks= 2, col=brewer.pal(8,"Set3"),main="Set3 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greys"),main="Greys 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greens"),main="Greens 8 colors")
```

*** =right

![plot of chunk unnamed-chunk-49](assets/fig/unnamed-chunk-49-1.png) 

***

--- .rcr

## Line Chart


```r
plot(AirPassengers,type="l")  #Simple Line Plot
```

![plot of chunk unnamed-chunk-50](assets/fig/unnamed-chunk-50-1.png) 

--- .rcr &twocol_width

## Bar Chart

*** =left width:48%

```r
barplot(iris$Petal.Length) #Creating simple Bar Graph
```

![plot of chunk unnamed-chunk-51](assets/fig/unnamed-chunk-51-1.png) 
*** =right width:48%

```r
barplot(iris$Sepal.Length,col  = brewer.pal(3,"Set1"))
```

![plot of chunk unnamed-chunk-52](assets/fig/unnamed-chunk-52-1.png) 
***

--- .rcr
## Bar Chart

```r
barplot(table(iris$Species,iris$Sepal.Length),col  = brewer.pal(3,"Set1")) #Stacked Plot
```

![plot of chunk unnamed-chunk-53](assets/fig/unnamed-chunk-53-1.png) 

--- .rcr

## Box Plot

```r
boxplot(iris$Petal.Length~iris$Species) #Creating Box Plot between two variable
```

![plot of chunk unnamed-chunk-54](assets/fig/unnamed-chunk-54-1.png) 

--- .rcr &twocol_width

## Box Plot

*** =left width:48%


```r
data(iris)
par(mfrow=c(2,2))
boxplot(iris$Sepal.Length,col="red")
boxplot(iris$Sepal.Length~iris$Species,col="red")
boxplot(iris$Sepal.Length~iris$Species,col=heat.colors(3))
boxplot(iris$Sepal.Length~iris$Species,col=topo.colors(3))
```

*** =right width:48%

![plot of chunk unnamed-chunk-56](assets/fig/unnamed-chunk-56-1.png) 

***

--- .rcr

## Scatter Plots

```r
plot(x=iris$Petal.Length) #Simple Scatter Plot
```

![plot of chunk unnamed-chunk-57](assets/fig/unnamed-chunk-57-1.png) 

```r
plot(x=iris$Petal.Length,y=iris$Species) #Multivariate Scatter Plot
```

![plot of chunk unnamed-chunk-57](assets/fig/unnamed-chunk-57-2.png) 

```r
plot(iris,col=brewer.pal(3,"Set1"))
```

![plot of chunk unnamed-chunk-57](assets/fig/unnamed-chunk-57-3.png) 

```r
pie(table(iris$Species))
```

![plot of chunk unnamed-chunk-57](assets/fig/unnamed-chunk-57-4.png) 

--- .rcr &twocol_width

## Hexbin Binning

* We can use the hexbin package in case we have multiple points in the same place (overplotting). Hexagon binning is a form of bivariate histogram useful for visualizing the structure in datasets with large n. 

*** =left width:48%


```r
#library(ggplot2) to get diamonds dataset
library(hexbin)
a=hexbin(diamonds$price,diamonds$carat,xbins=40)
library(RColorBrewer)
plot(a)
```

*** =right width:48%

<img src="assets/fig/unnamed-chunk-59-1.png" title="plot of chunk unnamed-chunk-59" alt="plot of chunk unnamed-chunk-59" style="display: block; margin: auto;" />

***

--- .rcr 

## (Contd)


```r
# We can also create a color palette and then use the hexbin plot function for a better visual effect. 
rf <- colorRampPalette(rev(brewer.pal(40,'Set3')))
hexbinplot(diamonds$price~diamonds$carat, data=diamonds, colramp=rf)
```

<img src="assets/fig/unnamed-chunk-60-1.png" title="plot of chunk unnamed-chunk-60" alt="plot of chunk unnamed-chunk-60" style="display: block; margin: auto;" />

--- .rcr

## Mosaic Plot

* A mosaic plot can be used for plotting categorical data very effectively with the area of the data showing the relative proportions.

```r
data(HairEyeColor)
mosaicplot(HairEyeColor)
```

<img src="assets/fig/unnamed-chunk-61-1.png" title="plot of chunk unnamed-chunk-61" alt="plot of chunk unnamed-chunk-61" style="display: block; margin: auto;" />

--- .rcr

## Heat Map

* Heat maps enable you to do exploratory data analysis with two dimensions as the axis and the third dimension shown by intensity of color. 
* However you need to convert the dataset to a matrix format. Here’s the code:


```r
heatmap(as.matrix(mtcars))
```

<img src="assets/fig/unnamed-chunk-62-1.png" title="plot of chunk unnamed-chunk-62" alt="plot of chunk unnamed-chunk-62" style="display: block; margin: auto;" />

--- .rcr

## Heat Map (contd)

* You can use `image()` command also for this type of visualization as:

```r
image(as.matrix(mtcars[2:7]))
```

<img src="assets/fig/unnamed-chunk-63-1.png" title="plot of chunk unnamed-chunk-63" alt="plot of chunk unnamed-chunk-63" style="display: block; margin: auto;" />

--- .rcr &twocol_width

## 3D Graphs

*** =left width:48%

* Install package R Commander 
`install.packages("Rcmdr")`
* Install Lattice package
* Correlogram (GUIs)

Correlogram help us visualize the data in correlation matrices. Here’s the code:


```r
cor(iris[1:4])
```

```
##              Sepal.Length Sepal.Width Petal.Length Petal.Width
## Sepal.Length    1.0000000  -0.1175698    0.8717538   0.8179411
## Sepal.Width    -0.1175698   1.0000000   -0.4284401  -0.3661259
## Petal.Length    0.8717538  -0.4284401    1.0000000   0.9628654
## Petal.Width     0.8179411  -0.3661259    0.9628654   1.0000000
```

*** =right width:48%


```r
corrgram(iris)
```

<img src="assets/fig/unnamed-chunk-65-1.png" title="plot of chunk unnamed-chunk-65" alt="plot of chunk unnamed-chunk-65" style="display: block; margin: auto;" />

***

--- .rcr

## What more can be done with R?

* Data cleaning/preprocessing
* Profiling and debugging
* Regression Models
* Machine learning/Data Mining
* ...

--- .rcr

## Learning R

* User documentation on CRAN
   - An Introduction on R: http://cran.r-project.org/doc/manuals/r-release/R-intro.html
* Online tutorials
   - http://www.cyclismo.org/tutorial/R/
* Educational R packages
   - Swirl: Learn R in R
* Online courses (e.g. Coursera)
   
   
--- .rcr

--- .rcr

## Data Analysis Case Study

* Changes in Fine Particle Air Pollution in the U.S.
* example data analysis looking at changes in fine particulate matter (PM) air pollution in the United States using the EPA freely available national monitoring data.
* Download PM2.5 data for 1999 and 2012


```bash
# *NIX only
wget  https://raw.githubusercontent.com/jtleek/modules/master/04_ExploratoryAnalysis/CaseStudy/pm25_data/RD_501_88101_1999-0.txt  https://raw.githubusercontent.com/jtleek/modules/master/04_ExploratoryAnalysis/CaseStudy/pm25_data/RD_501_88101_2012-0.txt
```


```r
pm0 <- read.table ( "RD_501_88101_1999-0.txt", comment.char="#", header=FALSE,sep="|", na.strings="")
dim(pm0)
```

```
## [1] 117421     28
```

```r
head(pm0[,1:13])
```

```
##   V1 V2 V3 V4 V5    V6 V7 V8  V9 V10      V11   V12    V13
## 1 RD  I  1 27  1 88101  1  7 105 120 19990103 00:00     NA
## 2 RD  I  1 27  1 88101  1  7 105 120 19990106 00:00     NA
## 3 RD  I  1 27  1 88101  1  7 105 120 19990109 00:00     NA
## 4 RD  I  1 27  1 88101  1  7 105 120 19990112 00:00  8.841
## 5 RD  I  1 27  1 88101  1  7 105 120 19990115 00:00 14.920
## 6 RD  I  1 27  1 88101  1  7 105 120 19990118 00:00  3.878
```

--- .rcr

## contd


```r
cnames <- readLines('RD_501_88101_1999-0.txt',1)
cnames <- strsplit ( cnames , "|" , fixed = TRUE )
names ( pm0 ) <- make.names ( cnames [[ 1 ]])
head ( pm0 [, 1 : 13 ])
```

```
##   X..RD Action.Code State.Code County.Code Site.ID Parameter POC
## 1    RD           I          1          27       1     88101   1
## 2    RD           I          1          27       1     88101   1
## 3    RD           I          1          27       1     88101   1
## 4    RD           I          1          27       1     88101   1
## 5    RD           I          1          27       1     88101   1
## 6    RD           I          1          27       1     88101   1
##   Sample.Duration Unit Method     Date Start.Time Sample.Value
## 1               7  105    120 19990103      00:00           NA
## 2               7  105    120 19990106      00:00           NA
## 3               7  105    120 19990109      00:00           NA
## 4               7  105    120 19990112      00:00        8.841
## 5               7  105    120 19990115      00:00       14.920
## 6               7  105    120 19990118      00:00        3.878
```

```r
x0 <- pm0 $ Sample.Value
summary(x0)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##    0.00    7.20   11.50   13.74   17.90  157.10   13217
```

--- .rcr

## contd





