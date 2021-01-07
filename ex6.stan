// stan model for Bioassay data
data {
  int<lower=0> N; 	// dose levels
  int<lower=0> n [N]; 	// number of animals
  int<lower=0> y [N]; 	// number of deaths
  vector[N] x;  
  vector[2] mu_theta;
  matrix[2, 2] sigma_theta;
}

parameters {
  vector[2] theta;
}

model {
//prior
  theta ~ multi_normal(mu_theta, sigma_theta);
  for (i in 1:N) {                             
//likelihood
    y[i] ~ binomial_logit(n[i],theta[1]+theta[2]*x[i]); 
  }
}

