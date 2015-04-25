## 

## This allows the solution to be cached(saved for later).

makeCacheMatrix <- function(x = matrix()) {
        s<-NULL
        set<- function(y){
          x<<-y
          s<<-NULL
        }
        get<-function() x
        setinverse<- function(solve) s<<- solve
        getinverse<- function () s
        list(set= set, get=get,
             setinverse = setinverse,
             getinverse=getinverse)
}


## This will either grab the cached version and return it.
## or it will calculate it and save it in the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    s<-x$getinverse()
    if(!is.null(s)){
      message ("getting cached data")
      return(s)
      
    }
  data<-x$get
  s<-solve(data, ...)
  x$setinverse(s)
  s
}
