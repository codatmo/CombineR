library(rstan)
library(bayesplot)

combineR_dat <- list(N=11,
                     y = c(0.7400, 0.7045, 0.7400, 0.7500, 0.7954, 0.8329, 0.7862, 0.9382, 0.8302, 0.9293, 0.7600),
                     sigma = c(0.0790, 0.0742, 0.0790, 0.2371, 0.0028, 0.0256, 0.1233, 0.1351, 0.0077, 0.0637, 0.0608))
fit <- stan(file = 'combineR.stan', data = combineR_dat, iter = 10000, control = list(adapt_delta=0.99))
posterior <- as.matrix(fit)
mcmc_intervals(posterior, pars = c("mu"))
