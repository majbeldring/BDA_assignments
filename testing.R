#####################################
#  Bayesian Data Analysis 02936 DTU #
#  Maj Beldring Henningen, F2020    #
#####################################

setwd('C:/Users/majhe/Google Drive/PhD/kurser/bayesian_02936')
#install.packages("rmarkdown")
library(rmarkdown)

tinytex::install_tinytex()

install.packages("rstan", repos = "https://cloud.r-project.org/", dependencies = TRUE)


# echo=FALSE ; dont include code and plots
# eco=TRUE; include code and plots

## Assignment 1, Q2, a. dbeta
## dbeta(), seq(), 

# method 1 - creating a function
mu = 0.2 
var = 0.01

# method with defining a function
estBetaParams <- function(mu, var){
  a <- mu * (mu * (1 - mu) / var - 1)
  b <- a * (1 - mu) / mu 
  return(params = list(a = a, b = b))
}

# method 2, dbeta(), seq()
mu = 0.2 
var = 0.01
a = mu * (mu * (1 - mu) / var - 1)
b = a * (1 - mu) / mu
x_beta <- seq(0, 1, by = 0.01) # linear space bewteen 0 1 and 1 in 100 steps
y_beta <- dbeta(x_beta, shape1 = a, shape2 = b) 
plot(y_beta)

random1000 <- rbeta(1000, shape1=a, shape2=b)
hist(random1000, main="1000 random samples", xlab="samples", col="darkgreen")

mean(random1000)
var(random1000)

quantile(random1000, probs = c(0.05, 0.95))

## Q4 - lung cancer
cancer = .001 # Population w cancer
healthy = 1 - cancer # Population healthy
pos_cancer = .98 # Pos tests in cancer group 
neg_healthy = .96 # Neg tests in healthy group
pos_healthy = 1 - neg_healthy #pos tests in healthy group
neg_cancer = 1 - pos_cancer # neg tests in cancer group

pos_healthy_pop = pos_healthy * healthy  
neg_cancer_pop = neg_cancer * cancer
pos_healthy_pop*100 # percent wrongly Positive
neg_cancer_pop*100 # percent wrongly Negative

neg_healthy_pop = neg_healthy * healthy  
pos_cancer_pop = pos_cancer * cancer
neg_healthy_pop*100 # percent correctly Negative
pos_cancer_pop*100 # percent correctly Positive

install.packages('table-simple')

############# ###############
### AThen
stopifnot(getRversion() >= "3.6.0")
stopifnot(require('PriorGen'))
#install.packages('PriorGen')
stopifnot(require('rjags'))
#install.packages('rjags')
stopifnot(require('runjags'))
#install.packages('runjags')
stopifnot(require('coda'))
stopifnot(require('TeachingDemos'))
#install.packages('TeachingDemos')
stopifnot(require('HSROC'))
#install.packages('HSROC')
stopifnot(require('MCMCpack'))
stopifnot(require('mada'))
testjags()
stopifnot(testjags()$JAGS.available)
stopifnot(numeric_version(testjags()$JAGS.version) >= "4.3.0")
stopifnot(testjags()$rjags.found)
stopifnot(numeric_version(testjags()$rjags.version) >= "4-8")

### ALL IS RUNNING!