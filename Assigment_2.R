makeCacheMatrix <- function( mat = matrix() ) {
  
   inv <- NULL
   
    set <- function( matrix ) {
    mat <<- matrix
    inv <<- NULL
  }
  
  get <- function() {
    mat
  }
  
  setInverse <- function(inverse) {
    inv <<- inverse
  }

  getInverse <- function() {
    inv
  }
 
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


cacheSolve <- function(x, ...) {
  mat <- x$getInverse()

  if( !is.null(mat) ) {
    message("getting cached data")
    return(mat)
  }
  
  data <- x$get()
  mat <- solve(data) %*% data
  x$setInverse(mat)
  
  mat
}