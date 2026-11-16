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

# (d) U = 10000
set.seed(465)
U2 <- 10000
theta2 <- rbeta(U2, 5, 3)
mean(theta2)
mean(theta2 > 0.6)
mcse2 <- sd(theta2) / sqrt(U2)
sd(theta2); mcse2
mean(theta2) + c(-1, 1) * 1.96 * mcse2
mcse / mcse2           # ratio of standard errors (~ sqrt(10))

# exact values for comparison
5 / 8
1 - pbeta(0.6, 5, 3)
