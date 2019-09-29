## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
##This function creates a special "matrix" object that can cache its inverse.
  x <<- x
  i <<- cacheSolve (x)
}


## Write a short comment describing this function

cacheSolve <- function(d, ...) {
  ## This function computes the inverse of the special
  ## "matrix" returned by `makeCacheMatrix` above. If the inverse has
  ## already been calculated (and the matrix has not changed), then
  ## `cacheSolve` should retrieve the inverse from the cache.
  

  if(identical(d,x)) {
    solve(d)
  }
  
  ## Computing the inverse of a square matrix can be done with the `solve` 
  ## function in R. For example, if `X` is a square invertible matrix, then
  ## `solve(X)` returns its inverse.
  
  
  ## Return a matrix that is the inverse of 'x'
}
