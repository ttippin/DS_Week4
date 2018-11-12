#Chapter 20.4.6 homework for data science accelerator.

#1: What does mean(is.na(x)) tell you about a vector x? What about sum(!is.finite(x))?
x <- c(Inf, -Inf, NA, NaN, 0, 1)

mean(is.na(x)) #mean = 2/6 values so it is calculating the average NA/NaN values per the set.
sum(!is.finite((x))) #This equaled 4, which is the combo of infinite + NA/NaN numbers.

#2: Carefully read the documentation of is.vector(). What does it actually test for? Why does is.atomic() not agree with the definition of atomic vectors above?
?is.vector #is.vector returns TRUE if x is a vector of the specified mode having no attributes other than names. It returns FALSE otherwise.
#is.atomic checks to see if the modes are one of the following: "logical", "integer", "numeric" (synonym "double"), "complex", "character" and "raw".is.atomic says objects are atomic even if they have other attributes.

#3: Compare and contrast setNames() with purrr::set_names().
setNames(1:3, c("orange","blue","white"))
purrr::set_names(1:3, c("orange","blue","white"))
#Key differences: set_names() allows for using a function or formula to transform the existing names and this function also checks that the length of the names argument is the same length as the vector that is being named, and will raise an error if it is not.

#4: Create functions that take a vector as input and returns:
  
#A) The last value. Should you use [ or [[?
the_last_value <- function(x) {
if (length(x)) {x[[length(x)]]} 
else {x}}
the_last_value(numeric())
the_last_value(1)

#B) The elements at even numbered positions.
even <- function(x) {
  if (length(x)) {
    x[seq_along(x) %% 2 == 0]
  } else {
    x
  }  
}
even(numeric())
even(1:10)

#C) Every element except the last value.
not_last <- function(x) {
n <- length(x)
if (n) {
x[-n]
} else { x } }
not_last(1:5)  

#D) Only even numbers (and no missing values).
even_numbers <- function(x) {
x[x %% 2 == 0] }
even_numbers(1:10)  
                                      
#5: Why is x[-which(x > 0)] not the same as x[x <= 0]?
x <- c(Inf, -Inf, NA, NaN, 0, 1)
x[-which(x > 0)]
x[x <= 0]
#x[x<=0] returns the same values except for NaN, where it returns NA. 

#6: What happens when you subset with a positive integer that’s bigger than the length of the vector? What happens when you subset with a name that doesn’t exist?
example <- c(x = 10, y = 20)
example[8]
#Returns NA values when subsetting with integers larger than the vectors length

