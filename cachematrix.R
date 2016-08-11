## Put comments here that give an overall description of what your
## functions do

##  JCFoster:  The cachematrix.R file contains two functions, makeCacheMatrix() and cacheSolve(). 
##  The first function in the file creates an R object that stores a matrix and its inverse. The 
##  second function requires an argument that is returned by makeCacheMatrix() in order to 
##  retrieve the cached inverse.

## Write a short comment describing this function

## JCFoster:  makeCacheMatrix() builds a set of functions and returns the functions within 
## a list to the parent environment. 

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL                        
    set <- function(y) {             
        x <<- y                      
        m <<- NULL                   
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function

##  JCFoster:  cacheSolve() calculates and stores the matrix inverse for the input argument 
##  if it is of type makeCacheMatrix().

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
