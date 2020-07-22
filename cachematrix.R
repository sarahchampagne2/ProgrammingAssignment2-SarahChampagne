## These functions compute a matrix which can cache its inverse and then use
## the second function to compute the inverse.

## This function will create the special matrix which will use the second function to compute the inverse.

makeCacheMatrix <- function(x = matrix()) {
m<-NULL
set<-function(y)
  x<<-y
  m<<-NULL
}
get<-function()x
setinverse<-function(inverse)m<<-inverse
getinverse<-function()m
list(set=set,get=get,
     setinverse=setinverse,
     getinverse=getinverse)
}

## This function will compute the inverse of the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  mat<-x$get()
  m<-solve(mat,...)
  x$setinverse(m)
  m
}
