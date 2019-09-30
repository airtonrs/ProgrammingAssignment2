## Airton SILVA (2019-09-29)
## Programs Assigment #2 - Lexical Scoping 
## There are two functions to test the Lexical Scoping
## One, makeCachMatrix, creates a special matrix that can cache its inverse
## Second, cacheSolve, check if the matrix can has been changed and calculate 
##     the inversion.

makeCacheMatrix <- function(m = matrix()) {
##This function creates a special "matrix" object that can cache its inverse.
  ## matrix inverse nullable
  i <- NULL
  old <- matrix()
  
  ## Creation of set function, which set the values in 
  ##   the variables in the scope of makeCacheMatrix
  set <- function(cm) {
    old <<- m
    m <<- cm 
    i <<- NULL
  }
  
  ## Function that return the matrix in m
  get <- function() m
  
  getold <- function() old
  
  ## Funciton that set the inverse matrix to the i variable
  setinv <- function(iv) i <<- iv
  
  ## Function that returns the matrix inverse
  getinv <- function() i
  
  #list of "functions" of gets and sets
  list(set=set(m),get=get(),setinv=setinv(i),getinv=getinv(),getold=getold())
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## This function computes the inverse of the special
  ## "matrix" returned by `makeCacheMatrix` above. If the inverse has
  ## already been calculated (and the matrix has not changed), then
  ## `cacheSolve` should retrieve the inverse from the cache.
  f <- makeCacheMatrix(x)
  
  if(!is.null(f$getold)) {
    if (identical(f$get,f$getold)) {
      if (!is.null(f$getinv)) {
        message("getting data from cache")
        return(f$getinv)
      }
    }  else {
      message("matrix has changed. Setting a new inverse!")
    }
  }
  
  if (is.null(f$get)) {
    message("matrix not defined")
  } 
      
  ## Set the inverse matrix of matrix in x
  message("Setting inverse data in cache")
  f$setinv(solve(f$get)) 

  #return the inverse 
  f$getinv()
}
