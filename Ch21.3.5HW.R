#Chapter 21.3.5 homework for data science accelerator

library(tidyverse)
library(stringr)
library(nycflights13)

#1: Imagine you have a directory full of CSV files that you want to read in. You have their paths in a vector, files <- dir("data/", pattern = "\\.csv$", full.names = TRUE), and now want to read each one with read_csv(). Write the for loop that will load them into a single data frame.
all_csv <- c("one.csv", "two.csv")
all_dfs <- vector("list", length(all_csv))
for (i in all_csv) {
  all_dfs[[i]] <- read_csv(all_csv[[i]])
}
bind_rows(all_dfs)

#2: What happens if you use for (nm in names(x)) and x has no names? What if only some of the elements are named? What if the names are not unique?
no_names <- 1:5
some_names <- c("one" = 1, 2, "three" = 3)
repeated_names <- c("one" = 1, "one" = 2, "three" = 3)
for (nm in names(no_names)) print(identity(nm)) #nothing is populating
for (nm in names(some_names)) print(identity(nm)) #there is one output that doesn't have a value, it has "" as the value
for (nm in names(repeated_names)) print(identity(nm)) #values are assigned to all outputs

#3: Write a function that prints the mean of each numeric column in a data frame, along with its name. For example, show_mean(iris) would print:
means <- function(x) {the_class <- vector("logical", length(x))
for (i in seq_along(x)) the_class[[i]] <- is.numeric(x[[i]])
x <- x[the_class]
for (i in seq_along(x)) {
cat(paste0(names(x)[i], ": ", round(mean(x[[i]]), 2)), fill = TRUE)}
}
means(iris)
means(mtcars)