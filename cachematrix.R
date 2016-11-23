 

makeCacheMatrix <- function(x = matrix()) {

}


## The function makeCacheMatrix creates a matrix in the global environment
 
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL # intialize inv to NULL
    # Set the value of x in the global environment
    set <- function(y) {
        x <<- y
        inv <<- NULL 
    } 
    # The function get simply returns parameter passed onto makeCacheMatrix
    get <- function() x
    # setinv sets the function to Solve. This would work for matrix operators as well.
    # setinv sets the value of inv to solve, which would actually compute the inverse
    setinv <- function(solve) inv <<- solve
    # getinv gets tjhe value of inv from the global environment
    getinv <- function() inv
    # Finally, a list of set, get, setinv, getinv is returned
    list(set = set, get = get, setinv = setinv, getinv = getinv)
    
}
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    # Get the value of inv from the global environment
    inv <- x$getinv()
    # If the value in the parent environment is not NULL, simply return inv
    if(!is.null(inv)) {
        message("getting cached matrix")
        return(inv)
        
    }
    # The following gets executed if inv is NULL in the global environment
    # Get the matrix that is cached
    data <- x$get()
    # compute inverse of the input matrix x
    inv <- solve(data, ...)
    # set the value in the global environment and return inv
    x$setinv(inv)
    inv
    
    
}