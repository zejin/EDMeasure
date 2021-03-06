% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pmdc.R
\name{pmdc}
\alias{pmdc}
\title{Partial Martingale Difference Correlation}
\usage{
pmdc(X, Y, Z)
}
\arguments{
\item{X}{A vector, matrix or data frame, where rows represent samples, and columns represent variables.}

\item{Y}{A vector, matrix or data frame, where rows represent samples, and columns represent variables.}

\item{Z}{A vector, matrix or data frame, where rows represent samples, and columns represent variables.}
}
\value{
\code{pmdc} returns the squared partial martingale difference correlation 
  of \code{Y} given \code{X} adjusting for the dependence on \code{Z}.
}
\description{
\code{pmdc} measures conditional mean dependence of \code{Y} given \code{X} adjusting for the 
dependence on \code{Z}, where each contains one variable (univariate) or more variables (multivariate).
Only the U-centering approach is applied.
}
\examples{
# X, Y, Z are 10 x 2 matrices with 10 samples and 2 variables
X <- matrix(rnorm(10 * 2), 10, 2)
Y <- matrix(rnorm(10 * 2), 10, 2)
Z <- matrix(rnorm(10 * 2), 10, 2)

pmdc(X, Y, Z)
}
\references{
Park, T., Shao, X., and Yao, S. (2015).
  Partial martingale difference correlation.
  Electronic Journal of Statistics, 9(1), 1492-1517.
  \url{http://dx.doi.org/10.1214/15-EJS1047}.
}
