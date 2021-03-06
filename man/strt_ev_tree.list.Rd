% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/1-base-model-function.R
\name{strt_ev_tree.list}
\alias{strt_ev_tree.list}
\title{Stratified event tree from list}
\usage{
\method{strt_ev_tree}{list}(x, ...)
}
\arguments{
\item{x}{a list with component named as the variables and containing the vector
of factor}

\item{...}{additional parameters}
}
\value{
A stratified event tree object, that is a list with a `tree` component
}
\description{
Stratified event tree from list
}
\details{
Build the stratified event tree object from a named list containing the
         levels of the variables. The output is an object with the `tree` component.
}
