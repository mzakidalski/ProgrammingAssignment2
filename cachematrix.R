
callMethod <- function (object, methodName, ...) {
  attr(object, methodName, ...)
}

addMethod  <- function(object, methodName, methodBody) {
  attr(object, methodName) <- methodBody
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
  
    
  attr(x, "set") <- set
  attr(x, "get") <- get
  attr(x, "setInverse") <- setInverse
  attr(x,"getInverse") <- getInverse
  
  x
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inverse <- attr(x,"getInverse") ()
  
  if (!is.null(inverse)) {
    
    message("Getting inverse matrix from the cache!")
    return(inverse)
    
  } else {
    
    message("Computing the inverse matrix!")  
    
  }
  
  data <- attr(x, "get")() 
  inverse <- solve(data, ...)
  attr(x, "setInverse")(inverse) 
  inverse
}


initialMatrixOne <- matrix (c(1,0,0,1),2,2)
class(initialMatrixOne)
cacheMatrixOne <- makeCacheMatrix(initialMatrixOne)
cacheSolve(cacheMatrixOne)
cacheSolve(cacheMatrixOne)

