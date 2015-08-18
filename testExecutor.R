source("cachematrix.R")


initialMatrixOne <- matrix (c(1,0,0,1),2,2)
class(initialMatrixOne)
cacheMatrixOne <- makeCacheMatrix(initialMatrixOne)
cacheSolve(cacheMatrixOne)
cacheSolve(cacheMatrixOne)