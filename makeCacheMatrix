## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Initialize the cached inverse as NULL
  
  # Setter function for the matrix
  set <- function(y) {
    x <<- y       # Assign new matrix to x in the parent environment
    inv <<- NULL  # Reset the cached inverse when the matrix changes
  }
  
  # Getter function for the matrix
  get <- function() x
  
  # Setter function for the inverse
  setinverse <- function(inverse) inv <<- inverse
  
  # Getter function for the inverse
  getinverse <- function() inv
  
  # Return a list of the above four functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed),
## then it retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()  # Retrieve cached inverse
  
  # If the inverse is already cached, return it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Otherwise, calculate the inverse
  mat <- x$get()
  inv <- solve(mat, ...)  # Compute inverse using solve()
  x$setinverse(inv)      # Cache the inverse
  inv                    # Return the inverse
}
