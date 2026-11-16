# STT 465 HW4 - Question 4: Direct Monte Carlo for theta | x ~ Beta(5, 3)

# (b) U = 1000
set.seed(465)
U <- 1000
theta <- rbeta(U, 5, 3)
mean(theta)            # estimate of E(theta | x)
mean(theta > 0.6)      # estimate of P(theta > 0.6 | x)

# (c) Monte Carlo standard error and 95% MC confidence interval
mcse <- sd(theta) / sqrt(U)
sd(theta); mcse
mean(theta) + c(-1, 1) * 1.96 * mcse

set.seed(465)

U_2 <- 10000

theta_2 <- rbeta(U_2, 5, 3)

mean(theta_2)

mean(theta_2 > 0.6)

Monte_carlo_error_2 <- sd(theta_2) / sqrt(U_2)

sd(theta_2)

Monte_carlo_error_2

mean(theta_2) + c(-1, 1) * 1.96 * Monte_carlo_error_2

Monte_carlo_error / Monte_carlo_error_2          

# exact values for comparison
5 / 8
1 - pbeta(0.6, 5, 3)

# exact values for comparison
5 / 8
1 - pbeta(0.6, 5, 3)
