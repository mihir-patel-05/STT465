# STT 465 HW4 - Question 5: f(x) = 2x on (0, 1)

# (d) Acceptance-rejection with g = Unif(0,1), M = 2
set.seed(465)
n_target <- 5000
draws <- numeric(n_target)
n_acc <- 0; n_try <- 0
while (n_acc < n_target) {
  x_star <- runif(1)
  u <- runif(1)
  n_try <- n_try + 1
  if (u <= x_star) {          # accept if u <= f(x*) / (M g(x*)) = x*
    n_acc <- n_acc + 1
    draws[n_acc] <- x_star
  }
}
mean(draws)                   # compare with exact E_f(X) = 2/3
n_acc / n_try                 # empirical acceptance rate (theory: 1/2)

# (e) Importance sampling with g = Unif(0,1)
set.seed(465)
z <- runif(5000)
w <- 2 * z                    # w(z) = f(z) / g(z)
mean(w * z)                   # IS estimate of E_f(X)
sd(w * z) / sqrt(5000)        # its Monte Carlo standard error
