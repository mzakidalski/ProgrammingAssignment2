source("cachematrix.R")

message("Simple test case showing the code works correctly!")
message("Computing the inverse matrix of two given matrices alternately!")

initialMatrixOne <- matrix (c(1,0,0,1),2,2)
cacheMatrixOne <- makeCacheMatrix(initialMatrixOne)
message("\n\nFirst matrix")
print(cacheMatrixOne)

initialMatrixTwo <- matrix (c(1,2,3,0, 1,4, 5,6,0),3,3)
cacheMatrixTwo <- makeCacheMatrix(initialMatrixTwo)
message("\n\nSecond matrix")
print(cacheMatrixTwo)

for (i in 1:2)
{
  print(cacheSolve(cacheMatrixOne))
  print(cacheSolve(cacheMatrixTwo))
  
}



