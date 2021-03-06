% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/3-inference-functions.R
\name{logLik.staged_ev_tree}
\alias{logLik.staged_ev_tree}
\title{Compute log lik of a staged tree}
\usage{
\method{logLik}{staged_ev_tree}(object, ...)
}
\arguments{
\item{object}{the staged event tree object}

\item{...}{additional parameters}
}
\description{
Compute log lik of a staged tree
}
\examples{
DD <- DD <- as.data.frame(sapply(1:5, function(i){
                          return(as.factor(sample(c(1:3), size=100, replace = TRUE)))
                     }))
sevt <- staged_ev_tree(DD, fit =TRUE)
logLik(sevt)
}
