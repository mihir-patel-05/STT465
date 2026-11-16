set.seed(2026)

x <- c(8.4, 10.1, 9.7, 11.2, 10.5,
       9.1, 10.8, 11.0, 9.6, 10.3)

n <- length(x)
xbar <- mean(x)
SS <- sum((x - xbar)^2)
B <- 50000

simulate_posterior_with_50000 <- function(mu0, p0, nu0, SS0) {
  pn <- p0 + n
  mun <- (p0 * mu0 + n * xbar) / pn
  nun <- nu0 + n
  SSN <- SS0 + SS + p0 * n / pn * (xbar - mu0)^2


  sigma2 <- 1 / rgamma(
    B, shape = nun / 2, rate = SSN / 2
  )

  mu <- rnorm(
    B, mean = mun, sd = sqrt(sigma2 / pn)
  )

  list(mu = mu, sigma2 = sigma2)
}

original <- simulate_posterior_with_50000(
  mu0 = 9, p0 = 3, nu0 = 4, SS0 = 8
)

#part c eastimating the posterior

mean(original$mu)
mean(original$mu > 10)
quantile(original$mu, c(0.025, 0.975)) 


#part d with original priors
mean(original$sigma2)
quantile(original$sigma2, c(0.025, 0.975))

par(mfrow = c(1, 2))

plot(density(original$mu),
     main = "Posterior density of mu",
     xlab = expression(mu))

plot(density(original$sigma2, from = 0),
     main = "Posterior density of variance",
     xlab = expression(sigma^2)) 


#part e with weak priors
weak <- simulate_posterior_with_50000(
  mu0 = 0, p0 = 0.01,
  nu0 = 0.01, SS0 = 0.01
)

mean(weak$mu)
mean(weak$mu > 10)
quantile(weak$mu, c(0.025, 0.975))

mean(weak$sigma2)
quantile(weak$sigma2, c(0.025, 0.975)) 