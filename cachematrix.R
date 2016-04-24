## The two functions below computes the inverse of a matrix, 
## and saves it (and the original matrix) into an especial object that allows retrieving.


## This function creates an object that saves the matrix and its inverse. 
## Also, it can retrieve both, the matrix and the inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(z) {
    inv <<- z
  }
  getInverse <- function() {
    inv
  }
  
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## This function solve a matrix stored in a special object.

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("Recupera la matriz de la memoria Cache")
    return(inv)
  }
  matriz <- x$get()
  inv <- solve(matriz)
  x$setInverse(inv)
  inv
}
