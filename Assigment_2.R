## Here I start the code creating a matrix that uses the inverse

makeCacheMatrix <- function( mat = matrix() ) {
  
   inv <- NULL
   
    set <- function( matrix ) {
    mat <<- matrix
    inv <<- NULL
  }

## Here I use the method get for the matrix
  get <- function() {
    mat
  }

  ## Here I use the method set inverse for the matrix
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  ## Here I use the method get inverse for the matrix
  getInverse <- function() {
    inv
  }
 
## I set it to get a final list with all the methods used so far  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## In this section I create the code to get the solution of the inverse of the cache
cacheSolve <- function(x, ...) {
  mat <- x$getInverse()

  if( !is.null(mat) ) {
    message("getting cached data")
    return(mat)
  }
## Calculate the inverse and set it  
  data <- x$get()
  mat <- solve(data) %*% data
  x$setInverse(mat)

  ##Return the final matrix  
  mat
}