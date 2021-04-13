data {
  int<lower=0> N; // num models
  real y[N];
  real<lower=0> sigma[N];
}
parameters {
  real theta[N];      // per-model R
  real mu;            // mean R
  real<lower=0> tau;  // deviation of Rs
}
model {
  y ~ normal(theta, sigma);
  theta ~ normal(mu, tau);
  mu ~ normal(0, 10);
  tau ~ cauchy(0, 5);
}

