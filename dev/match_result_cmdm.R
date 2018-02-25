#
set.seed(12345)
X <- matrix(rnorm(10 * 3), 10, 3)
Y <- rnorm(10)
Z <- matrix(rnorm(10 * 3), 10, 3)

#
mdd(X, Y, compute = "C", center = "U")
mdd(X, Y, compute = "C", center = "D")

# cd cmi/simulation/ff/ff5_year
dyn.load("MDD.so")

MDD_U <- function(N, P, U, V, Q) {
  if (!(is.numeric(N) && is.numeric(P) && is.numeric(U) && is.numeric(V) &&
        is.numeric(Q)))
    stop("arguments must be numeric")
  out <- .C("MDD_U",
            N=as.integer(N),
            P=as.integer(P),
            X=as.double(U),
            Y=as.double(V),
            Q=as.double(Q))
  return(list(Q = out$Q))
}

MDD_D <- function(N, P, U, V, M, Q) {
  if (!(is.numeric(N) && is.numeric(P) && is.numeric(U) && is.numeric(V) &&
        is.numeric(M) && is.numeric(Q)))
    stop("arguments must be numeric")
  out <- .C("MDD_D",
            N=as.integer(N),
            P=as.integer(P),
            X=as.double(U),
            Y=as.double(V),
            M=as.double(M),
            Q=as.double(Q))
  return(list(Q = out$Q))
}

set.seed(12345)
X <- matrix(rnorm(10 * 3), 10, 3)
Y <- rnorm(10)
Z <- matrix(rnorm(10 * 3), 10, 3)

#
MDD_U(10, 3, X, Y, 0)$Q
MDD_D(10, 3, X, Y, matrix(0, 10, 10), 0)$Q

#
set.seed(12345)
X <- matrix(rnorm(10 * 3), 10, 3)
Y <- matrix(rnorm(10 * 3), 10, 3)
Z <- matrix(rnorm(10 * 3), 10, 3)

#
mdd(X, Y, compute = "R", center = "U")
mdc(X, Y, center = "U")
pmdd(X, Y, Z)
pmdc(X, Y, Z)
mddm(X, Y, compute = "R")

# cd cmi/simulation/reference
source('MDD/MDD.R')
source('MDDM/MDDM.R')
set.seed(12345)
X <- matrix(rnorm(10 * 3), 10, 3)
Y <- matrix(rnorm(10 * 3), 10, 3)
Z <- matrix(rnorm(10 * 3), 10, 3)

#
MDD(X, Y)
MDC(X, Y)
pMDD(X, Y, Z)
pMDC(X, Y, Z)
MDDM(X, Y)
