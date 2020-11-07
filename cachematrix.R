## The first function creates a list, the second function returns the inverse of the matrix

## The first function creates an R object that stores a list with several outputs of the matrix X.

makeCacheMatrix <- function(x = matrix()) {
  invers <- NULL
  set <- function(y){
    x <<- y
    invers <<- NULL
  }
get <- function() x
setinverse <- function(inverse) invers <<- inverse
getinverse <- function() invers
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## The function inverse the matrix x from makeCacheMatrix(). makeCacheMatrix() is incomplete without cacheSolve().

cacheSolve <- function(x, ...) {
  invers <- x$getinverse()
  if(!is.null(invers)) {
    message("getting cached data")
    return(invers)
  }
  mat <- x$get()
  invers <- solve(mat, ...)
  x$setinverse(invers)
  invers
}        ## Return a matrix that is the inverse of 'x'


