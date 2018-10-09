

forward_select.staged_ev_treee <- function(object=NULL, data=NULL, lambda = 1,
                                           score = function(x) return(-BIC(x))){
  if (is.null(object)){
    if (is.null(data)){
      warning("Provide something fitted staged event tree or data")
      return(NULL)
    }
    object <- staged_ev_tree(data, fit =TRUE, lambda = lambda)
  }
  if (is.null(data)){
    data <- object$data
    if (is.null(data)){
      warning("Provide data")
      return(object)
    }
  }
  now <- score(object)



}

#' backword model selectio
#'
#' @param object a staged event tree model (optional)
#' @param data the data (can be not specified if it is attached to \code{object})
#' @param order the order of the tree (optional)
#' @param lambda the laplace smoothing factor
#' @param score the score function to be maximized
#' @param eps the stopping criteria for the relative score increase
#' @param max_iter the maximum number of iteration
#' @param verbose If info should be printed
#' @export
backward_select.staged_ev_tree <- function(object = NULL, data = NULL, order = NULL
                                           , lambda=1
                                           , score = function(x) return( - BIC(x) )
                                           , eps = 0.0001, max_iter = 100
                                           , verbose = FALSE){
  if (is.null(object)){
    if (is.null(data)){
      warning("Provide something: the fitted staged event tree or data")
      return(NULL)
    }
    ## if the staged event tree is not provided initialize it to the full model
    object <- staged_ev_tree(strt_ev_tree(data, fit = TRUE,
                                          order = order, lambda = lambda))
  }
  if (is.null(data)){
    data <- sevt$data
    if (is.null(data)){
      warning("Provide data")
      return(object)
    }
  }
  now_score <- score(object)
  r <- 1
  iter <- 0
  while (r > eps && iter < max_iter){ ## chose randomly one of the variable and try to perform a stage-merging
    iter <- iter + 1
    v <- sample(names(object$tree)[ - 1 ],size = 1)
    if (length(object$stages[[ v ]]) > 1 ){
      stgs <- sample(object$stages[[ v ]], size = 2, replace = FALSE) ##select randomly two stages
      try <- join_stages(object, v, stgs[1], stgs[2]) ## join the 2 stages
      try_score <- score(try)
      if (try_score > now_score){
        object <- try
        r <- abs((try_score - now_score) / now_score) ##compute relative score increase
        now_score <- try_score
        if (verbose){
           print(paste("joined for", v, "stages: ", stgs[1], "and", stgs[2]))
        }
      }
    }
  }
  if (verbose){ print(paste("Exit after", iter, "iteration"))}
  return(object)
}