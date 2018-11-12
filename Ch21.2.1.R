#Chapter 21.2.1 homework #1-4
library(mtcars)
library(nycflights13)
library(stringr)

#1:Write for loops to:
  
#a) Compute the mean of every column in mtcars.
means <- vector("double", ncol(mtcars))
names(means) <- names(mtcars)
for (i in names(mtcars)) {
  means[i] <- mean(mtcars[[i]])}
means
#b) Determine the type of each column in nycflights13::flights.
data(flights)
type <- vector("list", ncol(flights))
names(type) <- names(flights)
for (i in names(flights)) {
  type[[i]] <- class(flights[[i]])}
type
#c) Compute the number of unique values in each column of iris.
data(iris)
iris_uniq <- vector("double", ncol(iris))
names(iris_uniq) <- names(iris)
for (i in names(iris)) {
  iris_uniq[i] <- length(unique(iris[[i]]))}
iris_uniq
#d) Generate 10 random normals for each of μ= −10,0,10, and 100.
n <- 10
num <- c(-10, 0, 10, 100)
normals <- vector("list", length(num))
for (i in seq_along(normals)) {
normals[[i]] <- rnorm(n, mean = num[i])}
normals

#2: Eliminate the for loop in each of the following examples by taking advantage of an existing function that works with vectors:
str_c(out, collapse = "")

sd(x)

cumsum(x)

#3:Combine your function writing and for loop skills:
  
#a) Write a for loop that prints() the lyrics to the children’s song “Alice the camel”.
camel <- c("five", "four", "three", "two", "one", "no")
for (i in camel) {
cat(str_c("Alice the camel has ", rep(i, 3), " humps.",
collapse = "\n"), "\n")
if (i == "no") {
cat("Now Alice is a horse.\n")
} else {
cat("So go, Alice, go.\n")}
cat("\n")}
#b) Convert the nursery rhyme “ten in the bed” to a function. Generalise it to any number of people in any sleeping structure.
numbers <- c("ten", "nine", "eight", "seven", "six", "five","four", "three", "two", "one")
for (i in numbers) {
cat(str_c("There were ", i, " in the bed\n"))
cat("and the little one said\n")
if (i == "one") {
cat("I'm lonely...")
} else {
cat("Roll over, roll over\n")
cat("So they all rolled over and one fell out.\n")
}
cat("\n")
}
#c) Convert the song “99 bottles of beer on the wall” to a function. Generalise to any number of any vessel containing any liquid on any surface.
bottles <- function(i) {
if (i > 2) {
bottles <- str_c(i - 1, " bottles")
} else if (i == 2) {
bottles <- "1 bottle"
} else {
bottles <- "no more bottles"}
bottles}

beer_bottles <- function(n) {
for (i in seq(n, 1)) {
cat(str_c(bottles(i), " of beer on the wall, ", bottles(i), " of beer.\n"))
cat(str_c("Take one down and pass it around, ", bottles(i - 1)," of beer on the wall.\n\n"))}
cat("No more bottles of beer on the wall, no more bottles of beer.\n")
cat(str_c("Go to the store and buy some more, ", bottles(n), " of beer on the wall.\n"))}
beer_bottles(3)

#4: It’s common to see for loops that don’t preallocate the output and instead increase the length of a vector at each step. How does this affect performance? Design and execute an experiment.
add_to_vector <- function(n) {  
output <- vector(integer, 0)
for (i in seq_len(n)) {
output <- c(output, i)
}
output  
}
flights(add_to_vector(10000), times = 3)


add_to_vector_2 <- function(n) {
output <- vector(integer, n)
for (i in seq_len(n)) {
output[[i]] <- i
}
output
}
flights(add_to_vector_2(10000), times = 3)



