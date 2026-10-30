# STT 465 HW3 - Question 5: posterior simulation and prior sensitivity
set.seed(465)
x <- c(8.4, 10.1, 9.7, 11.2, 10.5, 9.1, 10.8, 11.0, 9.6, 10.3)

n <- length(x)

xbar <- mean(x)

SS <- sum((x - xbar)^2)

nig_post <- function(mu0, p0, nu0, SS0) {
  pn  <- p0 + n
  mun <- (p0 * mu0 + n * xbar) / pn
  nun <- nu0 + n
  SSn <- SS0 + SS + (p0 * n / pn) * (xbar - mu0)^2
  list(pn = pn, mun = mun, nun = nun, SSn = SSn)
}


sim_post <- function(post, S = 50000) {
  sigma2 <- 1 / rgamma(S, shape = post$nun / 2, rate = post$SSn / 2)
  mu     <- rnorm(S, mean = post$mun, sd = sqrt(sigma2 / post$pn))
  data.frame(mu = mu, sigma2 = sigma2)
}

post1  <- nig_post(mu0 = 9, p0 = 3, nu0 = 4, SS0 = 8)
draws1 <- sim_post(post1)


# (c) mu summaries
mean(draws1$mu)

mean(draws1$mu > 10)

quantile(draws1$mu, c(.025, .975))





# (d) sigma^2 summaries and plots
mean(draws1$sigma2); quantile(draws1$sigma2, c(.025, .975))
par(mfrow = c(1, 2))
plot(density(draws1$mu), main = expression("Posterior of " * mu), xlab = expression(mu))
plot(density(draws1$sigma2), main = expression("Posterior of " * sigma^2),
     xlab = expression(sigma^2), xlim = c(0, 4))



# (e) weak prior
post2  <- nig_post(mu0 = 0, p0 = 0.01, nu0 = 0.01, SS0 = 0.01)
draws2 <- sim_post(post2)
mean(draws2$mu); mean(draws2$mu > 10); quantile(draws2$mu, c(.025, .975))
mean(draws2$sigma2); quantile(draws2$sigma2, c(.025, .975))
