# R Book available as pdf:
# Link: http://cran.r-project.org/doc/manuals/R-intro.pdf

#HELP commands:
#help(...)
#?
#help.search("...")
#??
#R is case sensitive!!!
help(matrix)
?matrix
help(Matrix)
help.search("Matrix")
??Matrix


#--------------------------- R as calculator ----------------------------------
3 + 3      #addition; code works regardless of the spaces, but it is recommended to use them
3 - 5      #subtraction
3 * 5      #multiplication
3 / 5      #division

3 ^ 5       #exponentiation
sqrt(81)    #square root
243 ^ (1/5) #a-th root

1.5 + 1.5

#----------------------------- Objects in R ------------------------------------
#---Assignments--- 
x <- 5                                         #store 5 in variable (object) x (assignment)
y <- 3                                         #store 3 in variable y
z <- x + y                                     #sum of two variables
z <- sum(x, y)                                 #sum of two variables
z
(z <- x - y)                                   #difference between two variables, result is printed

#-----
ls()                                           #objects in the workspace
getwd()                                        #current working directory
setwd("C:/")                                   #set working directory
#-----

x = 5                                          #'=' may also be used as assignment operator, but only at the top level, not within the scope of a function; '<-' can be used anywhere -> see help
?<-                                            #error!
  help(<-)                                     #error!
?'<-'                                          #functions like '<-', '*', '%*%' etc. have to be quoted in order to invoke the help function
sum(z = 1:10)                                  
z                                              #assignment was not made since the scope was within 'sum'
sum(z <- 1:10)                                 
z                                              #assignment was made

(z <- x * y)                                   
(z <- x / y)
(z <- x ^ y)
(z <- sqrt(x))
(z <- exp(y))
(z <- log(exp(y)))                               #nested functions are evaluated from the inside to the outside

#---Vectors---                                   #ordered set of elements of the same type
(vec0 <- 1:10)                                   #create vector from 1 to 10
(vec1 <- c(3, 2, 7, 4, 6))                       #create a vector using c(ombine values)
(vec2 <- rep(5, 10))                             #replicate elements
(vec3 <- 1:10)                                   #generate sequence (steps of '1' or '-1')
(vec3 <- -5:5)
(vec3 <- 10:-5)
(vec3 <- 0.7:10.7)
(vec3 <- seq(from = 0, to = 1, by = 0.1))        #generate sequence
(vec3 <- seq(from = 0, to = 1, length.out = 11))
(vec3 <- seq(0, 1, 0.1))
(vec3 <- seq(0, 1, len = 11))                    #R checks for exact matches first, then for partial matches -> works if there is exactly one partial match  
(vec4 <- sample(0:1, 20, replace = TRUE))        #0, 1 random numbers
(vec4 <- sample(0:1, 20))                        #error!
(vec5 <- c("a", "b", "c"))                       #Vector of characters
(vec6 <- c(3, "a", 2, "b"))                      #Vector of characters!
str(vec1)                                        #display the structure of an R object
str(vec5) 
str(vec6) 

#subselection of vector elements
vec1[3]                                        #select 3rd element
vec1[c(1, 5)]                                  #select 1st and 5th element
vec1[-3]                                       #select all elements except the 3rd element
vec1[c(-1, -5)]                                #select all elements except the 1st and 5th element
vec1[-c(1, 5)]                                 #the same
aa <- 1:2
vec1[aa]
vec1[-aa]
vec1 == 3                                      #relational operator returning a logical vector (TRUE/FALSE)
vec1 > 3                                       
which(vec1 > 3)                                #positions of the TRUE values
vec1[vec1 > 3]                                 #only elements that show TRUE are returned
vec1[which(vec1 > 3)]                          #the same

#Set operations
setdiff(vec0, vec1)                            #select elements that are part of vec0, but not vec1
setdiff(vec1, vec0)
union(vec0, vec1)                              #union of all elements in vec0 and vec1 (no duplicates!)
vec7 <- 5:15
union(vec0, vec7)
intersect(vec0, vec1)                          #which elements are part of vec0 and vec1? each element of vec0 is compared
setequal(vec0, vec1)                           #are all elements of vec0 and vec1 the same?
vec8 <- 5:15
setequal(vec7, vec8)
vec9 <- 15:5
setequal(vec7, vec9)
is.element(vec0, vec1)                         #are the single elements of vec0 contained in vec1?
vec0 %in% vec1                                 #the same
which(vec0 %in% vec1)                          #which elements of vec0 are contained in vec1?

#---Matrices---                                #2-dimensional array of elements of the same type
mat1 <- matrix(1:10, ncol = 2)                 #elements column-wise
mat1 <- matrix(1:10, ncol = 2, byrow = TRUE)   #elements row-wise
mat2 <- t(mat1)                                #transpose
mat1 * mat2                                    #"*" is not the operator used for matrix multiplication!
mat1 %*% mat2                                  #matrix multiplication, gives matrix product
mat1 * mat1                                    #Hadamard product

#select elements                               
mat1[1, 2]                                     #select element (1,2)
mat1[1, ]                                      #select row 1
mat1[, 2]                                      #select column 2
mat1[, aa]

#---Data Frames---                             #similar to matrix, but different types of variables are possible
d1 <- letters[1:10]                           #letters a...j
d2 <- 1:10                                    #numbers 1 to 10
d3 <- 10:1
str(d1)                                       
str(d2)
df23 <- data.frame(d2, d3)                   #concatenate as data frame
df23
is.matrix(df23)                                #a data frame is not a matrix by this test!
df12 <- data.frame(d1, d2)                   
str(df12)
df12[5, ]                                      #select 5th row

#---List---                                    #ordered set of components that may have different types; most flexbile data structure
list1 <- list(d1, d2, vec1, mat1)            #list of letters, vectors, matrix
list1[1]                                       #select first list element, keeping the name
list1[[1]]                                     #select first list element (letters), dropping the name
list1[1:3]                                     #select the first 3 elements of the list
list1[[1:3]]                                   #only one list element can be selected if the name is dropped!
list1[[1]][5]                                  #pick out 5th letter

list1[[4]]                                     #select the matrix
list1[[4]][4, 2]                               #pick out element (4, 2)

names(list1) <- c("let", "seq", "vec", "mat")  #label list
list1
list1$mat                                      #instead of list[[4]] (important!)
list1$mat[, 2]                                 #select 2nd column
?"[["                                          #see help for the differences between '[', '[[' and '$'

#--------------------------------- end objects ---------------------------------


#--------------------------------- Functions ---------------------------------
set.seed(42) #Set the seed for the rng

#Define a function which will roll and sum dice
roll <- function( nDice=2, diceSides=6){
  dice <- sample( diceSides, size = nDice, replace=TRUE)
  #print(dice)
  sum(dice)
}

roll(diceSides=20)
roll(diceSides=100:200)

#Roll the dice and store the output 10000 times!
nRolls <- replicate(10000, roll(nDice=2))

#Plot the output
hist(nRolls)

#--------------------------------- end Functions  ---------------------------------





