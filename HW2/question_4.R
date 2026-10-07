set.seed(1)
U <- 10000

omega_x <- rbeta(
  U,
  shape1 = 438,
  shape2 = 544
)

omega_y <- rbeta(
  U,
  shape1 = 399,
  shape2 = 423
)

print(mean(omega_x < omega_y))

# (e) A frequentist analysis uses
print(prop.test(
  c(437, 398),
  c(980, 820),
  alternative = "less"
))
