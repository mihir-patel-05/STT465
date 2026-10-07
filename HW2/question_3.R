# Install HDInterval automatically if it isn't already installed
if (!requireNamespace("HDInterval", quietly = TRUE)) {
  install.packages("HDInterval", repos = "https://cloud.r-project.org")
}

# 95% equal-tailed credible interval
equal_tailed <- qbeta(c(0.025, 0.975), shape1 = 22, shape2 = 4)
print(equal_tailed)

# 95% highest posterior density interval (HPDI)
set.seed(1)
omega_post <- rbeta(10000, shape1 = 22, shape2 = 4)

hpdi <- HDInterval::hdi(omega_post, credMass = 0.95)
print(hpdi)
