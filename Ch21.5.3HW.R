#Chapter 21.5.3 homework #1

library(tidyverse)
library(mtcars)
library(nycflights13)
library(iris)

#1: Write code that uses one of the map functions to:

#A) Compute the mean of every column in mtcars.
map_dbl(mtcars, mean)
#B) Determine the type of each column in nycflights13::flights.
map_chr(nycflights13::flights, typeof)
#C) Compute the number of unique values in each column of iris.
map_dbl(iris, ~ length(unique(.)))  
#D) Generate 10 random normals for each of μ=−10, 0, 10, and 100.
map(c(-10, 0, 10, 100), ~ rnorm(n = 10, mean = .))
