#
set.seed(12345)
X <- matrix(rnorm(10 * 3), 10, 3)
Y <- rnorm(10)
Z <- matrix(rnorm(10 * 3), 10, 3)

#
mdd(X, Y, compute = "C", center = "U")
mdd(X, Y, compute = "R", center = "U")

mdd(X, Y, compute = "C", center = "D")
mdd(X, Y, compute = "R", center = "D")

mdc(X, Y, center = "U")
mdc(X, Y, center = "D")

pmdd(X, Y, Z)
pmdc(X, Y, Z)

# cd cmi/simulation/ff/ff5_year
set.seed(12345)
X <- matrix(rnorm(10 * 3), 10, 3)
Y <- rnorm(10)
Z <- matrix(rnorm(10 * 3), 10, 3)

#
dyn.load("MDD.so")

MDD <- function(N, P, U, V, Q) {
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

MDD(10, 3, X, Y, 0)$Q

MDD <- function(N, P, U, V, M, Q) {
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

MDD(10, 3, X, Y, matrix(0, 10, 10), 0)$Q

#
source('MDD.R')

MDD(X, Y)

MDC(X, Y)

pMDD(X, Y, Z)
pMDC(X, Y, Z)

