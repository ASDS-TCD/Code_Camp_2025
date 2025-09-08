###############################################################################
# Title:        ASDS - Coding Camp - Day 2
# Description:  R Basics - Part 1
# Author:       Elena Karagianni
# R version:    R 4.4.0
###############################################################################

# The hashtag sign '#' is used to write comments
# Text preceded by '#' will not be read by R 

This will be read by R, and will produce an error message. 

####################
# First things first
####################

# Run line shortcut: Ctrl + Enter (Windows)
#                    Cmd + Enter (MasOS)

# An R session should begin as an empty space, i.e. there should be no 
# *objects* in our environment. 

# The ls() function shows us a *list* of objects in our environment. To run
# this code, place the cursor on the line, and then press Ctrl/Cmd + Enter. 

ls()

# Let's look at some datasets again: 
data()

Nile
help(Nile)
mean(Nile)
plot(Nile)
hist(Nile)

# And now, for some simple commands: 
# You can use R as a calculator:  
2 + 2

# Create 7 random numbers between 0 and 1:
runif(7)

# R allows for two different versions to assign a value to a name
z <- 2 + 2 # preferred way
z = 2 + 2 

# 'c' stands for concatenate so 'y' here stoes the values 1,2, and 4. 
y <- c(1,2,4)

# Parts of individual objects can be accessed via square brackets
y[3]

# We can access multiple parts of objects with a colon
y[2:3]

# Suppose now we want the sum of y
sum(y)

# Store the output of a function in another object
z <- sum(y)
z
# Notice that we replaces the former 'z' object


### DIY: 
## Can you use the sqrt() function to compute the square root of 962?

# Your code here 

## Can you now assign to a new object? 

# Your code here


#########
# OOP 
#########

# R is an object-oriented programming language. This means, essentially, 
# that we make objects with functions, which we then manipulate with other
# functions. 

# The rm() function can be used to *remove* objects. Here, 
# we are passing the contents of the *list* created by calling the ls() function
# which we used earlier. Do not worry if this is unclear fow now: we are 
# simply clearing our workspace. 

rm(list = ls())

# Here, we assign the value 'Hello' to the object 'x'. 
x <- "Hello"

# The class() function tells us what *class* of object we have just created,
# in this case an object of class *character*
class(x)

# The length() function tells us how many discrete values or elements
# the object contains. 
length(x)

# Here, we have length = 1. Is this the result you were expecting? 

# We can use square brackets [ ] after an object's name to access a particular 
# element by its *index*. Indexes in R begin at 1. 
# x[1] is, therefore, "Hello"
x[1]

# We can use [ ] together with the *assignment operator* <- to add an
# element to x. Here, let's add the word 'world', which will be sorted in the 
# second index position.
x[2] <- "world"

# We have now a *character vector* of length 2. 
# The str_length() function returns the number of characters within
# each discrete element of x, here 5: 5 for [1] Hello, and [2] world. 

x
length(x)

# To run the str_length(x) command, we must first install and load the package
# 'stringr'
install.packages("stringr")
library(stringr)

str_length(x)

# If the elements of your vector have names, you can extract them by name.
# To do so, place a name or a vector of names, in the brackets behind a vector.
# Surround each name with quotation marks. 

# Extract the element named gamma from the vector below. 
vec2 <- c(alpha = 1, beta = 2, gamma = 3)

# Your code here


# We can use functions to create objects. Here, we use rnorm() to create an
# object comprising 50 *random* numbers drawn from the *normal distribution* 
# family (here with a mean) of 0 and standard deviation of 1 (these are the 
# default settings for the function).

x <- rnorm(n = 50)
length(x)
mean(x)
sd(x)

# Use rnorm() to generate 100 random normal values with a mean
# of 100 and a standard deviation of 15. 

# Your code here


# Now, assign them to an object named 'data'. 
# Then, on a new line, call the hist() function on data to plot 
# a histogram of the random values. 

# Your code here

# A strength of R is that many functions will be applied automatically 
# to every element in an object. Here, the multiplication function takes
# the *scalar* input 2 and applies it to each discrete element in y. 
# We then simultaneously assign the result of this operation back onto 
# y using the assignment operator. 

y <- x
y <- 2 * y

# Many functions return large *lists* of objects. Here, we use the lm()
# or *linear model* function to apply a linear regression of the objects
# y and x on each other, and assign the results to a new object, xylm. 

xylm <- lm(y~x)
xylm


# We use the attributes() function to list the objects created by lm()
attributes(xylm)

# We use the summary() function to provide an output of summary statistics.
# Unsurprisingly, we discover that the slope of y is 2. 

summary(xylm)

# When we plot() x and y, they are perfectly linear. Note that R provided us
# with a helpful warning that this is the case in the output of summary().
plot(x,y)

# One of the objects which lm() creates is the value of the *residuals*
# (i.e., the values "left over" between the predicted and actual values of y).
# We can access these by using the "$" operator. When a function creates a 
# *list* of objects, passing the name of the "top level" object (here: xylm)
# followed by $ and then the "lower level" object allows us to
# access the latter.

xylm$residuals
plot(xylm$residuals)

###########
# FUNctions
###########

# As well as being an object-oriented language, R is also a *functional*
# language. This essentially means that, rather than constantly writing loops
# in our code, we can express iterative behaviour implicitly. 

# Here is the long way of creating an object comprising a vector
# of the numbers 1 to 10. 
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Here is a *loop* doing the same thing.
# (Don't worry if this doesn't make sense yet!)

x <- vector("double", 10)
for (i in 1:10){
  x[i] <- i
}
x

# And here is the seq() function doing the same:
# a large saving in mental effort
x <- seq(1:10)

# Be careful though: here, if we want to add the number 11 onto the end of our 
# sequence, we must use the c() function. If we "add" using the + function, R 
# will add 11 to each discrete element in x. 

y <- x + 11
y <- c(x, 11)

# Every operator is itself a function, as we see by calling help 
# on the operator within quote marks. 

?"+"

?"c"

?"<-"

# Here, we use a number of different functions separately to calculate
# the *standard deviation* of our sequence, x. Does this tally with the 
# result we obtain by calling the sd() function?

x_mean <- mean(x)
x_length <- length(x)
x_dev <- x - x_mean
x_dev_sq <- x_dev ^ 2
x_sum_dev_sq <- sum(x_dev_sq)
x_var <- x_sum_dev_sq / x_length
x_sd <- sqrt(x_var)

x_sd
sd(x)
?sd

# Caution: sd() (and the var() function) assume you are using 
# *sample* statistics, for which the denominator is n-1: 
x_var_s <- x_sum_dev_sq / (x_length - 1)
x_sd_s <- sqrt(x_var_s)
x_sd_s
sd(x)

# -------------------------------------------------------------
# A reminder: 
# -------------------------------------------------------------
# Recall the formulas:
# Population standard deviation (divide by n):
#   σ = sqrt( Σ (xᵢ - μ)² / n )
#
# Sample standard deviation (divide by n - 1):
#   s = sqrt( Σ (xᵢ - x̄)² / (n - 1) )
# -------------------------------------------------------------

# One of R's strengths is the large number of *packages* which users
# have created for different tasks. Packages contain functions which 
# we can use on our data.

# The search() function shows us which packages are loaded in our R session. 

search()

# The install.packages() function allows us to install new packages from the 
# web. Here, we are installing a suite of packages known as the "tidyverse". 

install.packages("tidyverse")

# Installing a package does not make it available to us in our R session. 
# To make a package available, along with its functions, we need to use 
# the library() function. 

library(tidyverse)

search()

# The tidyverse packages are now listed in our session. 

#######
# Help!
#######

# There are many ways of accessing help in R. The help() function is the main
# method. Its shortcut is "?".

help(tidyverse)
?tidyverse
?persp

# The example() function provides an interactive demo

example(persp)


# Some packages have *vignettes*, which go into more detail than R help files
# (which can be very terse). The vignette() function accesses there, or use
# browseVignettes(package = "name") to search. 

?dplyr
vignette("dplyr")
browseVignettes(package = "dplyr")

# If you're looking for help on a particular area, and aren't sure what function
# or package to use, try the help.search() function. 

help.search("standard deviation")

#####################
# Taking R for a spin
#####################

# Let's finish by seeing a little of what R is capable of.

# mtcars is a built-in dataset contained in R's datasets library.
# It is, unsurprisingly, a dataset about cars. 

?mtcars

# The summary() function provides some summary statistics of the dataset. 
summary(mtcars)

# The str() function provides information about the *structure* of the dataset. 
str(mtcars)

# The head() function provides the first 6 entries in each variable. 
head(mtcars)

# The ls.str() function combines the ls() and str() functions. 
ls.str(mtcars)

# These are all useful functions to remember when exploring a new dataset. 

# The next example makes use of the 'ggplot2' package (a more advanced 
# graphics package than base R graphics) to produce a scatter plot which is 
# able simultaneously to show the relationship between five variables: 
# the weight of the car, its fuel economy, the number of cylinders, 
# its horsepower and type of transmission.
# Further, three trend lines show the relationship between weight and 
# mpg for 4, 6, and 8 cylinder cars. 

mtcars$am <- as.factor(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)

ggplot(mtcars, aes(wt, mpg, size = hp)) +
  geom_text(aes(size = hp, label = cyl, color = am)) +
  geom_smooth(aes(linetype = cyl), color = "grey", size = 0.5, 
              se = F, show.legend = F) +
  guides(size = "none") +
  theme_classic() + 
  theme(legend.title = element_blank(), legend.justification = c(1,1),
        legend.position = c(1,1)) +
  scale_color_manual(labels = c("manual", "automatic"), 
                     values = c("blue", "red")) +
  labs(title = "Plot of Fuel Efficiency by Weight for 32 Cars",
       subtitle = "Number of cylinders; size = horsepower") +
  xlab("Weight (1000 lbs)")

# It is not always a good idea to show so many variables
# simultaneously, but the plot gives a good idea of what
# is possible with R. Again, do not worry about the 
# specifics of the code at this point.

# A better example...
ggplot(mpg, aes(x = displ)) + 
  geom_histogram(bins = 10, fill = "darkblue", alpha = 0.5) +
  geom_text(stat = "bin", bins = 10, aes(label = stat(count),
                                         y = stat(count)), 
            nudge_y = 2, color = "darkblue", size = 3) +
  scale_x_continuous(breaks = 1:7) +
  theme_bw()

###############
# Some more DYI
###############

# The mpg dataset is a built in dataset for the ggplot
# package. By recycling the code in this script file, 
# explore the dataset and try creating your own simple 
# plots of the variables.

help(mpg)
head(mpg)

################
# And finally...
################

# While it might feel a bit overwhelming at first, using
# R gets easier with time and practice. Well done though 
# for getting through your first R session, and 
# congratulations, you survived R basics! 



