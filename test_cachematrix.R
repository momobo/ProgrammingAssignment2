
# test data

source("https://raw.githubusercontent.com/momobo/ProgrammingAssignment2/master/cachematrix.R")

mat <- c(1,0,0,0,2,0,0,0,3)
dim(mat) = c(3,3)
# check
solve(mat)
# test if it works
matC <- makeCacheMatrix(mat)
matinv <- cacheSolve(matC)
#be aware that matinv is a normale matrix
matinv
# check if cache used
cacheSolve(matC)
# check if I get the original matrix
matCinv <- makeCacheMatrix(matinv)
cacheSolve(matCinv)
cacheSolve(matCinv)
