56 / 21
qgamma(c(0.025, 0.975), shape = 56, rate = 21)

set.seed(1)
U <- 10000

lambda_post <- rgamma(
  U,
  shape = 56,
  rate = 21
)

x_future <- rpois(U, lambda = lambda_post)
mean(x_future >= 4)
