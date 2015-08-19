

##
## Function calls method with given methodName from
## object.
## Precodition: such method was added with addMethod function
##              or in similar manner
## Params:
##        object - where the method should be added
##        methodName - name of method to be called
##        ... - variable-length list of arguments
##              passed to the method
## Returns: 
##        - result of method call
##
##

callMethod <- function (object, methodName, ...) {
  method <- attr(object, methodName)
  method(...)
}

##
## Function adds method to given object
##
## Params: 
##        object - where the method should be added
##        methodName - name of the method
##        methodBody - method body
##
##

addMethod  <- function(object, methodName, methodBody) {
  attr(object, methodName) <- methodBody
  object
}

##
## Function creates matrix caching its inverse matrix
## Inverse matrix is stored in inverseX global variable.
## Function also adds appropriate methods to the matrix
## Params: 
##      x - source matrix
## Returns:
##      matrix (based on x) caching its reverse matrix 
##

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


##
## Method returns cached inverse matrix. If
## no cached value is available, then computation
## are performed and their result is stored in cache.
## Params:
##    x- matrix to be reversed
## Returns:
##    inverse matrix of x
##
##

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



