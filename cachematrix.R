## There are two functions below:
## 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## 2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

makeCacheMatrix <- function(x = matrix()) { ## creating a function 
  m <- NULL                                 ## 'm' is equal to zero in the beginning
  set <- function(y) {                      ## set is a function that changes the matrix stored in the main function
    x <<- y                                 ## restores to 'y' the value of 'x' 
    m <<- NULL                              ## restores to null the value of the inversion m
  }
  get <- function() {                       ## get is a function that returns the 
    x                                       ## matrix 'x' stored in the main function
  }
  setsolve <- function(solve) {             ## store the value of the input in a variable 'm' 
    m <<- solve                             ## into the main function makeCacheMatrix
  }
  getsolve <- function() {                  ## return the value of the input in a variable 'm' 
    m                                       ## into the main function makeCacheMatrix   
  }
  list(set = set, get = get,                ## store the 4 functions in the function makeCacheMatrix
       setsolve = setsolve,
       getsolve = getsolve)
}



cacheSolve <- function(x, ...) {            ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()                         ## verify the value 'm', stored previously with getsolve, 
  if(!is.null(m)) {                         ## exists and is not NULL. If it exists in memory, 
    message("getting cached data")          ## it simply returns a message and the value 'm', 
    return(m)                               ## that is supposed to be the inverse matrix
  }
  data <- x$get()                           ## data gets the vector stored with makeCacheMatrix, 
  m <- solve(data, ...)                     ## 'm' calculates the inverse matrix   
  x$setsolve(m)                             ## stores it in the object generated assigned with makeCacheMatrix
  m                                         ## return 'm'
}
