# Plot posterior densities
curve(dbeta(x, shape1 = 19, shape2 = 4),
      from = 0, to = 1,
      col = "blue", lwd = 2, ylim = c(0, 6),
      xlab = expression(omega),
      ylab = "Posterior density",
      main = "Posterior Distributions: Priors A and B")

curve(dbeta(x, shape1 = 22, shape2 = 3.9),
      add = TRUE, col = "red", lwd = 2)

# Mark the observed success proportion
abline(v = 18 / 21, col = "black", lty = 2, lwd = 2)

legend("topleft",
       legend = c("Prior A: Beta(19, 4)",
                  "Prior B: Beta(22, 3.9)",
                  "Sample proportion: 18/21"),
       col = c("blue", "red", "black"),
       lty = c(1, 1, 2), lwd = 2, bty = "n")
