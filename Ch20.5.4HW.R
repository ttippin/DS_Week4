#Chapter 20.5.4 homework for data science accelerator
library(mtcars)
library(tidyverse)

#1: Draw the following lists as nested sets:
#a) list(a, b, list(c, d), list(e, f))
#Since I can't draw, I can explain: AB will be the largest layer of the "list," then there will be a sublist within that for CD and another sublist for EF.

#b) list(list(list(list(list(list(a))))))
#Lists within lists within lists. 6 lists will be nested before reaching "a."

#2: What happens if you subset a tibble as if you’re subsetting a list? What are the key differences between a list and a tibble?
x <- as_tibble(mtcars)
x[10] #returns a tibble
x[[10]] #returns a vector 