#
set.seed(12345)
X <- matrix(rnorm(10 * 3), 10, 3)

#
set.seed(12345)
mdm_ica(X, type = "asym", algo = "def")$theta

set.seed(12345)
mdm_ica(X, type = "asym", num_bo = 1, kernel = "exp", algo = "def")$theta

set.seed(12345)
mdm_ica(X, type = "asym", num_bo = 1, kernel = "mat", algo = "def")$theta

#
set.seed(12345)
mdm_ica(X, type = "asym", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "asym", num_bo = 1, kernel = "exp", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "asym", num_bo = 1, kernel = "mat", algo = "par")$theta

#
set.seed(12345)
mdm_ica(X, type = "sym", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "sym", num_bo = 1, kernel = "exp", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "sym", num_bo = 1, kernel = "mat", algo = "par")$theta

#
set.seed(12345)
mdm_ica(X, type = "comp", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "comp", num_bo = 1, kernel = "exp", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "comp", num_bo = 1, kernel = "mat", algo = "par")$theta

#
set.seed(12345)
mdm_ica(X, type = "dhsic", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "dhsic", num_bo = 1, kernel = "exp", algo = "par")$theta

set.seed(12345)
mdm_ica(X, type = "dhsic", num_bo = 1, kernel = "mat", algo = "par")$theta

# cd ica/simulation/comp_4/exp_3/bo/seed_15/jordan_mix_0
# n_iter = 1
# theta2W i, j -> j, i
source('../fun_.R')
set.seed(12345)
x <- matrix(rnorm(10 * 3), 10, 3)
x <- scale(x, T, F)
num_comp <- 3
num_init <- 3 * 10
U.hat <- matrix.sqrt.inv.pc(cov(x))
z <- x %*% t(U.hat)
mat_mul <- function(W, Z) {
  Z %*% W
}

#
set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.asy.obj))
best_init <- theta_list[[which(obj_list == min(obj_list))]]
dCovICA.asy.seq.curr.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.asy.obj))
best_init <- dCovICA.asy.joint.bayes.exp(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.asy.seq.curr.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.asy.obj))
best_init <- dCovICA.asy.joint.bayes.mat(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.asy.seq.curr.nlm(z, theta.0 = best_init)$theta.hat

#
set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.asy.obj))
best_init <- theta_list[[which(obj_list == min(obj_list))]]
dCovICA.asy.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.asy.obj))
best_init <- dCovICA.asy.joint.bayes.exp(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.asy.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.asy.obj))
best_init <- dCovICA.asy.joint.bayes.mat(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.asy.joint.nlm(z, theta.0 = best_init)$theta.hat

#
set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.sym.obj))
best_init <- theta_list[[which(obj_list == min(obj_list))]]
dCovICA.sym.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.sym.obj))
best_init <- dCovICA.sym.joint.bayes.exp(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.sym.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.sym.obj))
best_init <- dCovICA.sym.joint.bayes.mat(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.sym.joint.nlm(z, theta.0 = best_init)$theta.hat

#
set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.com.obj))
best_init <- theta_list[[which(obj_list == min(obj_list))]]
dCovICA.com.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.com.obj))
best_init <- dCovICA.com.joint.bayes.exp(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.com.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.com.obj))
best_init <- dCovICA.com.joint.bayes.mat(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.com.joint.nlm(z, theta.0 = best_init)$theta.hat

#
set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.hsic.obj))
best_init <- theta_list[[which(obj_list == min(obj_list))]]
dCovICA.hsic.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.hsic.obj))
best_init <- dCovICA.hsic.joint.bayes.exp(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.hsic.joint.nlm(z, theta.0 = best_init)$theta.hat

set.seed(12345)
theta_init <- latin.hc(num_comp, num_init)
theta_mat <- theta_init$m
theta_list <- theta_init$l
W_list <- lapply(theta_list, theta2W)
W_list <- lapply(W_list, t)
s_list <- lapply(W_list, mat_mul, Z = z)
obj_list <- unlist(lapply(s_list, dCovICA.hsic.obj))
best_init <- dCovICA.hsic.joint.bayes.mat(z, theta.0 = theta_mat, obj.0 = obj_list)$theta.hat
dCovICA.hsic.joint.nlm(z, theta.0 = best_init)$theta.hat



