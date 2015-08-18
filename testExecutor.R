source("cachematrix.R")


## Test one - unity matrix
initialMatrixOne <- matrix (c(1,0,0,1),2,2)
class(initialMatrixOne)
cacheMatrixOne <- makeCacheMatrix(initialMatrixOne)
cacheSolve(cacheMatrixOne)
cacheSolve(cacheMatrixOne)

## Test two - other matrix
initialMatrixTwo <- matrix (c(1,2,3,0, 1,4, 5,6,0),3,3)
class(initialMatrixTwo)
cacheMatrixTwo <- makeCacheMatrix(initialMatrixTwo)
cacheSolve(cacheMatrixTwo)
cacheSolve(cacheMatrixTwo)


