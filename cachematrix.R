## Put comments here that give an overall description of what your
## functions do
## This two functins will return the inverse of input matrix. If the inverse of input matrix had been calculated once.
## Then it will automatically cache from memory, saving processing time.

## Write a short comment describing this function
## This is a function that make a new object into an object consisting of four function. 
## The user can set and get the inverse of input matrix by calling functions built in.
makeCacheMatrix<-function(x=matrix()){
  inv<<-NULL
  set<-function(y){
    x<<-y
  }
  get<-function(){
    x
  }
  setinv<-function(inverse){
    inv<<-inverse
  }
  getinv<-function(){
    inv
  }
  list(set=set,get=get,setinv=setinv,getinv=getinv)
}

## Write a short comment describing this function
## This is a function that return the inverse function of the matrix.
## If the inverse had not been calculated, this function will call the solve() function to solve for inverse
## If the inverse had been calculated once before, then this function will cache from the memory.

cacheSolve<-function(x,...){
  inv<-x$getinv()
  if(!is.null(inv)){
    message("Getting cached inverse")
    return(inv)
  }
  mat<-x$get()
  inv<-solve(mat,...)
  x$setinv(inv)
  inv
}