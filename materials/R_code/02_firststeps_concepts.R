## -------------------------------------------------------------------------------------------------
# a simle integer vector
a <- c(10,22,33,22,40)

# give names to vector elements
names(a) <- c("Andy", "Betty", "Claire", "Daniel", "Eva")
a

# indexing either via number of vector element (start count with 1)
# or by element name
a[3]
a["Claire"]

# Inspect the object you are working with
class(a) # returns the class(es) of the object
str(a) # returns the structure of the object ("what is in variable a?")



## -------------------------------------------------------------------------------------------------
# basic arithmetic 
2+2
sum_result <- 2+2
sum_result
sum_result -2
4*5
20/5

# order of operations
2+2*3
(2+2)*3
(5+5)/(2+3)

# work with variables
a <- 20
b <- 10
a/b

# arithmetic with vectors
a <- c(1,4,6)
a * 2

b <- c(10,40,80)
a * b
a + b 


# other common math operators and functions
4^2
sqrt(4^2)
log(2)
exp(10)
log(exp(10))

# special numbers
# Euler's number
exp(1)
# Pi
pi






## -------------------------------------------------------------------------------------------------
# vector to be summed up
numbers <- c(1,2.1,3.5,4.8,5)
# initiate total
total_sum <- 0
# number of iterations
n <- length(numbers)
# start loop
for (i in 1:n) {
     total_sum <- total_sum + numbers[i]
}

# check result
total_sum
# compare with result of sum() function
sum(numbers)



## -------------------------------------------------------------------------------------------------
# matrix to be summed up
numbers_matrix <- matrix(1:20, ncol = 4)
numbers_matrix



## -------------------------------------------------------------------------------------------------

# number of iterations for outer loop
m <- ncol(numbers_matrix)
# number of iterations for inner loop
n <- nrow(numbers_matrix)
# start outer loop (loop over columns of matrix)
for (j in 1:m) {
     # start inner loop
     # initiate total
     total_sum <- 0
     for (i in 1:n) {
          total_sum <- total_sum + numbers_matrix[i, j]
          }
     print(total_sum)
     }






## -------------------------------------------------------------------------------------------------
# initiate starting value
total <- 0
# start loop
while (total <= 20) {
     total <- total + 1.12
}

# check the result
total



## -------------------------------------------------------------------------------------------------
2+2 == 4
3+3 == 7


## -------------------------------------------------------------------------------------------------
condition <- TRUE
if (condition) {
     print("This is true!")
} else {
     print("This is false!")
}

condition <- FALSE
if (condition) {
     print("This is true!")
} else {
     print("This is false!")
}




## -------------------------------------------------------------------------------------------------
# own implementation: use R-function for summing up the elements in a vector
# and getting the number of elements in a vector
sum(a) / length(a)


## -------------------------------------------------------------------------------------------------
# define our own function to compute the mean, given a numeric vector
my_mean <- function(x) {
     x_bar <- sum(x) / length(x)
     return(x_bar)
}

# test it
my_mean(a)
# compare the result with the function delivered with the R installation
mean(a)


## -------------------------------------------------------------------------------------------------
# integer
integer_vector <- 10:20
integer_vector[2]
integer_vector[2:5]

# numeric
numeric_vector <- c(1.4, 5.6, 7.2)
numeric_vector[1]
numeric_vector[1:2]


## -------------------------------------------------------------------------------------------------
# character vector
string_vector <- c("a", "b", "c")
string_vector[-3]


## -------------------------------------------------------------------------------------------------
# initiate a list containing vectors
mylist <- list(numbers = numeric_vector, letters = string_vector)
mylist


## -------------------------------------------------------------------------------------------------
# with the element's name
mylist$numbers
mylist["numbers"]
# via the index
mylist[1]


## -------------------------------------------------------------------------------------------------
mylist[[1]]


## -------------------------------------------------------------------------------------------------
mynestedlist <- list(a = mylist, b = 1:5)
mynestedlist


## -------------------------------------------------------------------------------------------------
# initiate an integer vector
integer_vector <- 1:8
# initiate a matrix based on this vector
mymatrix <- matrix(integer_vector, nrow = 4)


## -------------------------------------------------------------------------------------------------
# return the second row
mymatrix[2,]
# return the first two columns
mymatrix[,1:2]
# return the cell in the second row of the first column
mymatrix[2,1]


## -------------------------------------------------------------------------------------------------
# data frames ("lists as columns")
mydf <- data.frame(Name = c("Alice", "Betty", "Claire"), Age = c(20, 30, 45))
mydf


## -------------------------------------------------------------------------------------------------
# select the age column
mydf$Age
mydf[, "Age"]
mydf[, 2]
# select the second row
mydf[2,]



## -------------------------------------------------------------------------------------------------
# have a look at the class of the object
class(mydf)
class(mymatrix)



## -------------------------------------------------------------------------------------------------
# have a closer look at the data structure
str(mydf)




## -------------------------------------------------------------------------------------------------
numbers2 <- c("1", "2", "3")

