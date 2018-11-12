#Chapter 20.3.5 homework #1-4 for data science acclerator.

#1: Describe the difference between is.finite(x) and !is.infinite(x).
num <- c(0, NA, Inf, -Inf, NaN)
is.finite(num)
!is.infinite(num)
#!is.infinite is taking anything that is not Inf, so it is include NA and NaN functions even though those aren't finite numbers.

#2: Read the source code for dplyr::near() (Hint: to see the source code, drop the ()). How does it work?
dplyr::near  
#It is checking to see if x and y are within a certain tolerance and the tolerance is defined as the sq root of `.Machine$double.eps`

#3: A logical vector can take 3 possible values. How many possible values can an integer vector take? How many possible values can a double take? Use google to do some research.
#Integer vectors: R uses a 32-bit representation. The maximum integer is 2^31 − 1 rather than 2^32 because 1 bit is used to represent the sign ( + , − ) and one value is used to represent NA_integer_.
#Double vectors: R uses a 64-bit representation. This means that they can hold up to 2^64 values exactly. However, some of those values are allocated to special values such as -Inf, Inf, NA_real_, and NaN

#4: Brainstorm at least four functions that allow you to convert a double to an integer. How do they differ? 
round up by .5, round down by .5, floor, ceil
