##Code below illustrates the lexical scoping concept using 2 functions that first creates a special object 
##that stores a matrix and the second function caches the inverset of the matrix and then retrieves from
##the cache when called next time for the same value

##This function creates a special object that stores a matrix in an environment different 
##from the current environment


makeCacheMatrix <- function(x = matrix()) {
        number <- NULL
        get <- function() x
        setinverse <- function(solve) number <<- solve
        getinverse <- function() number
        list(get=get,setinverse=setinverse,getinverse=getinverse)
}


## This function cache's the inverse of the matrix and retrieves from the cache when called again

cacheSolve <- function(x, ...) {
        number <- x$getinverse()
        if(!is.null(number))
        {
                message("Getting from cache")
                return(number)
        }
        data <- x$get()
        number <- solve(data,...)
        x$setinverse(number)
        number
        
        ## Return a matrix that is the inverse of 'x'
}
