
1+2

a=2+3
b<-10/a

a <- 3
b <- sqrt(a)
b

c <- 2i
d <- TRUE
d

as.numeric(d); as.character(b); is.complex(c)

# "#" indicates comment
# "<-" performs assignment operation (you can use "=" as well, but "<-" is preferred)
# numeric (double is the same as numeric)
d <- c(1,2,3)
# character
d <- c("1","2","3")
# you can covert at object with as.TYPE
# as. numeric changes the character vector created above to numeric
as.numeric(d)

# The conversion doesn't always work though
as.numeric("a")

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

as.logical(x)

x <- 1:4; y <- 6:9
x + y

x > 2

x * y

print( x[x >= 3] )

# Create a matrix using the matrix() function
m <- matrix(1:6, nrow = 2, ncol = 3)
m

dim(m)

attributes(m)

# Pass a dim attribute to a vector
m <- 1:10
m

dim(m) <- c(2, 5)
m

# Row binding and column binding
x <- 1:3
y <- 10:12
cbind(x, y)

rbind(x, y)

# Slicing
m

# element at 2nd row, 3rd column
m[2,3]

# entire i<sup>th</sup> row of m
m[2,]

# entire j<sup>th</sup> column of m
m[,3]

# Use the list() function to construct a list
x <- list(1, "a", TRUE, 1 + 4i)
x

# Each element in a vector can have a name
x <- 1:3
names(x)

names(x) <- c("a","b","c")
names(x)

x

# Lists
x <- list(a = 1, b = 2, c = 3)
x

# Names can be used to refer to individual element
x$a

# Columns and rows of matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

m <- matrix(1:10, nrow = 2, ncol = 5)
str(matrix)

str(m)

str(str)

# Use the factor() function to construct a vector of factors
# The order of levels can be set by the levels keyword
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x

# Dates are stored internally as the number of days since 1970-01-01
x <- as.Date("1970-01-01")
x

as.numeric(x)

x+1

# Times are stored internally as the number of seconds since 1970-01-01
x <- Sys.time() ; x

as.numeric(x)

p <- as.POSIXlt(x)
names(unclass(p))

p$sec

x <- c(1,2, NA, 10,3)
is.na(x)

is.nan(x)

x <- c(1,2, NaN, NA,4)
is.na(x)

is.nan(x)

# Random generation from a uniform distribution.
runif(10, 2, 4)

# You can name the arguments in the function call.
runif(10, min = 2, max = 4)

# Given p value and degree of freedom, find the t-value.
qt(p=0.975, df = 8)

# The inverse of the above function call
pt(2.306, df = 8)

newDef <- function(a,b)
 {
     x = runif(10,a,b)
     mean(x)
 }
newDef(-1,1)

x <- c("a", "b", "c", "d")
# These loops have the same effect
# Loop through the indices
for(i in 1:4) {
  print(x[i])
}


# Loop using the seq_along() function
for(i in seq_along(x)) {
  print(x[i])
}

# Loop through the name
for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

counter <- as.integer(readline(prompt="Enter an integer: "))

factorial <- 1                                                                                                                                                    
while ( counter > 0)
{
   factorial <-  factorial * counter                                                                                                                   
   counter = counter - 1                                                                                                                                 
}

print(factorial)

counter <- as.integer(readline(prompt="Enter an integer: "))

dble_factorial <- 1

repeat
{
    dble_factorial <- dble_factorial * counter
    
    if (counter <= 2)
        break
    else
        counter = counter - 2
    
}

print(dble_factorial)

# X: array objects
# MARGIN: a vector giving the subscripts which the function will be applied over
# FUN: a function to be applied
str(apply)

x <- matrix(rnorm(200), 20, 10)
# Row means
apply(x, 1, mean)

# Column sums
apply(x, 2, sum)

# 25th and 75th Quantiles for rows
apply(x, 1, quantile, probs = c(0.25, 0.75))

dim(x)

# Change the dimensions of x
dim(x) <- c(2,2,50)
# Take average over the first two dimensions
apply(x, c(1, 2), mean)

rowMeans(x, dims = 2)

library(tidyverse)

if ( !require('lubridate')){
    install.packages('lubridate')
} 

# read daily usage report for Sol in AY 2016-17
# usage is reported in terms of SUs used and jobs submitted for
#  serial (1 cpu), single or smp ( > 1 cpu but max of 1 node) and 
#  parallel or multi node (> 1 node)  jobs 
daily <- read_delim('http://webapps.lehigh.edu/hpc/training/soldaily1617-public.csv',delim=";")

daily %>% head

# Number of core hours available per month for AY 2016-17
# Oct 1, 2016: Initial launch with 780 cpu
# Mar 15, 2017: Added 192 cpus
# May 1, 2017: Added 312 cpus
# Total Available at end of AY 2016-17: 1284 cpus
ay1617su <- c(580320.00,561600.00,580320.00,580320.00,524160.00,580320.00,699840.00,955296.00,924480.00,955296.00,955296.00,924480.00)

monthly <- daily %>% 
  group_by(Month=floor_date(as.Date(Day), "month"),Name,Department,PI,PIDept,Status) %>% 
  summarize(Serial=sum(as.double(Serial)), # Single core or serial SUs consumed
    Single=sum(as.double(Single)), # Single node - multi core SUs consumed
    Multi=sum(as.double(Multi)), # Multi node SUs consumed
    Total=sum(as.double(Total)), # Total SUs consumed
    SerialJ=sum(as.double(SerialJ)), # Number of Single core or serial jobs 
    SingleJ=sum(as.double(SingleJ)), # Number of Single node - multi core jobs
    MultiJ=sum(as.double(MultiJ)), # Number Multi node jobs
    TotalJ=sum(as.double(TotalJ))) # Total Number of jobs jobs
monthly %>% head

monthly %>% 
  group_by(Month) %>%   
  summarize(Total=round(sum(as.double(Total)),2),Jobs=round(sum(as.double(TotalJ)))) %>%
  mutate(Available=ay1617su,Unused=Available-Total,Percent=round(Total/Available*100,2)) -> monthlyusage
monthlyusage

library(knitr)
monthly %>%
  group_by(PIDept) %>%
  summarize(Total=round(sum(as.double(Total)),2),Jobs=round(sum(as.double(TotalJ)))) -> monthlypidept
monthlypidept %>% kable

monthly %>%
  group_by(Department) %>%
  summarize(Serial=round(sum(as.double(Serial))),SMP=round(sum(as.double(Single))),DMP=round(sum(as.double(Multi))),Total=round(sum(as.double(Total)),2),Jobs=round(sum(as.double(TotalJ)))) %>%
  arrange(desc(Total)) -> monthlyuser
monthlyuser

library(xtable)
monthlyuser %>% xtable

monthly %>%
  group_by(Status) %>%
  summarize(Total=round(sum(as.double(Total)),2)) -> monthlystatus
monthlystatus

daily %>% 
  filter(as.Date(Day) >= "2017-02-01" & as.Date(Day) <= "2017-03-01") %>% 
  select(Day,Name,Department,PI,PIDept,Serial,Single,Multi) %>% 
  gather(JobType,Usage,Serial:Multi) %>% 
  filter(as.double(Usage) > 100 ) -> tmp
tmp %>% arrange(Usage) %>% head

tmp %>% arrange(Usage) %>% 
  spread(JobType,Usage,fill = 0.0) %>% head

daily %>% 
   select(c(Department,Day,Total)) %>% 
   separate(Day,c("Year","Month","Day"),sep="-") -> tmp
head(tmp)

tmp %>%
  unite(Day,c("Year","Month","Day"),sep="/") %>%
  tail

p <- monthlystatus %>%
  ggplot(aes(x=Status,y=Total)) + geom_col()
p

p + coord_flip()

p <- monthlyusage %>%
  ggplot(aes(Month,Percent)) + geom_col()
p

p + labs(title="Sol Usage", y="Percent", x="Month", caption="AY 2016-17")

p <- daily %>%
  group_by(Day, PIDept) %>%
  summarize(Total=round(sum(as.double(Total)),2),Jobs=round(sum(as.double(TotalJ)))) %>%
  ggplot(aes(Day,Total)) + geom_line(aes(col = PIDept))
p

p + facet_wrap( ~PIDept)

p + facet_wrap( ~PIDept, scales = "free", ncol = 2) + theme(legend.position='none')

if(!require('animation')){
    install.packages('animation')
}
if(!require('gganimate')){
    install.packages('animation')
}

weeklyusage_status <- daily %>%
  group_by(Week=floor_date(as.Date(Day), "week"),Status) %>% 
  summarize(Total=round(sum(as.double(Total)),2),Jobs=round(sum(as.double(TotalJ)))) %>%
  ggplot(aes(Week,Total,frame=Week,cumulative=TRUE)) + geom_line(aes(col = Status)) +
  facet_wrap( ~Status, scales = "free", ncol = 2) + theme(legend.position='none')

ani.options(interval = 0.1, ani.width = 640, ani.height = 480)
gganimate(weeklyusage_status,'weeklystatus.gif')

