% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mddm.R
\name{mddm}
\alias{mddm}
\title{Martingale Difference Divergence Matrix}
\usage{
mddm(X, Y, compute = "C")
}
\arguments{
\item{X}{A vector, matrix or data frame, where rows represent samples, and columns represent variables.}

\item{Y}{A vector, matrix or data frame, where rows represent samples, and columns represent variables.}

\item{compute}{The method for computation, including
\itemize{
  \item \code{C}: computation implemented in C code;
  \item \code{R}: computation implemented in R code.
}}
}
\value{
\code{mddm} returns the martingale difference divergence matrix of \code{Y} given \code{X}.
}
\description{
\code{mddm} extends martingale difference divergence from a scalar to a matrix.
It encodes the linear combinations of all univariate components in \code{Y}
that are conditionally mean independent of \code{X}.
Only the double-centering approach is applied.
}
\examples{
# X, Y are vectors with 10 samples and 1 variable
X <- rnorm(10)
Y <- rnorm(10)

mddm(X, Y, compute = "C")
mddm(X, Y, compute = "R")

# X, Y are 10 x 2 matrices with 10 samples and 2 variables
X <- matrix(rnorm(10 * 2), 10, 2)
Y <- matrix(rnorm(10 * 2), 10, 2)

mddm(X, Y, compute = "C")
mddm(X, Y, compute = "R")
}
\references{
Lee, C. E., and Shao, X. (2017).
  Martingale Difference Divergence Matrix and Its Application to Dimension Reduction for
  Stationary Multivariate Time Series.
  Journal of the American Statistical Association, 1-14.
  \url{http://dx.doi.org/10.1080/01621459.2016.1240083}.
}
