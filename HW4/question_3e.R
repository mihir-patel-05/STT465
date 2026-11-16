# STT 465 HW4 - Question 3(e): Dirichlet posterior via Gamma normalization
set.seed(465)
U <- 10000
alpha <- c(22, 14, 10)   # posterior Dir(2+20, 2+12, 2+8)

# Draw independent Gamma(alpha_k, 1) variables, then normalize
y1 <- rgamma(U, shape = alpha[1], rate = 1)
y2 <- rgamma(U, shape = alpha[2], rate = 1)
y3 <- rgamma(U, shape = alpha[3], rate = 1)
S  <- y1 + y2 + y3
w1 <- y1 / S; w2 <- y2 / S; w3 <- y3 / S

c(mean(w1), mean(w2), mean(w3))       # check vs. 22/46, 14/46, 10/46
mean(w1 > w2)                         # P(w1 > w2 | x)
quantile(w1 - w2, c(0.025, 0.975))    # 95% equal-tailed CI for w1 - w2
