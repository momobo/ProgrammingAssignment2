## These functions are the solution to the R programming 
## programming assignment 2: Caching the Inverse of a Matrix

## makeCacheMatrix create a cachable matrix structure

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
# function set exploit the scoping rules to access
# the closure variables
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(solved) inv <<- solved
  getinverse <- function() inv
# returned object, composed by 4 functions
# note that the matrix is hidden in the closure but
# is accessible through the functions
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## CacheSolve, when applied to a cachable matrix inverts the
## matrix, using the cache when possible

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ## be aware that the returned is a "normale" matrix
  ## not a cached one 
  
  inv <- x$getinverse()
  if(!is.null(inv)) {

    # if the inverse is already in the closure return it
    message("getting cached data")
    return(inv)
  } else {
    
    # not yet calculated. Do it with solve()
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    return(inv)
  }
  
}

