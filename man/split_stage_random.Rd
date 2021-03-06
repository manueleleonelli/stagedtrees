% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/1b-base-model-function.R
\name{split_stage_random}
\alias{split_stage_random}
\title{split randomly a stage}
\usage{
split_stage_random(object, var, stage, p = 0.5)
}
\arguments{
\item{object}{a staged event tree object}

\item{var}{the variable where to split the stage}

\item{stage}{the name of the stage}

\item{p}{probability}
}
\value{
a staged event tree object
}
\description{
Randomly assign some of the path to a new stage
}
\examples{
DD <- generate_random_dataset(2, 100)
model <- staged_ev_tree(DD, fit = TRUE, full = TRUE, lambda = 1)
}
