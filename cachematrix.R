
callMethod <- function (object, methodName, ...) {
  method <- attr(object, methodName)
  method(...)
}

addMethod  <- function(object, methodName, methodBody) {
  attr(object, methodName) <- methodBody
  object
}

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inverseX <- NULL
  
  set <- function(y) {
    x <<- y
    inverseX <<- NULL
  }
  
  get <- function() x
  setInverse <- function(inverse) inverseX <<- inverse
  getInverse <- function() {
    inverseX
  }
  
    
  x = addMethod(x, "set", set)
  x = addMethod(x, "get", get) 
  x = addMethod(x, "setInverse", setInverse)
  x = addMethod(x,"getInverse", getInverse)
  
  x
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inverse <- callMethod(x,"getInverse")
  
  if (!is.null(inverse)) {
    
    message("Getting inverse matrix from the cache!")
    return(inverse)
    
  } else {
    
    message("Computing the inverse matrix!")  
    
  }
  
  data <- callMethod(x, "get")
  inverse <- solve(data, ...)
  callMethod(x, "setInverse",inverse) 
  inverse
}



