## The following functions create:
## 1) an Invertable Matrix, and then creates
## 2) the Inverted Matrix.

## First "makeCacheMatrix" creates a matrix object that can cache its inverse:
makeCacheMatrix <- function(m = matrix()) {
  x <- NULL
  set <- function(matrix) {
    m <<- matrix
    x <<- NULL
  }
  get <- function() {m}
  setInverse <- function(inverse) {x <<- inverse}
  getInverse <- function() {x}
  list(set=set, get=get, setInverse=setInverse,  getInverse=getInverse)
}

## Then "cachesolve" computes the inverse of "makeCacheMatrix":
cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  y <- x$get()
  m <- solve(y) %*% y
  x$setInverse(m)
  m
}