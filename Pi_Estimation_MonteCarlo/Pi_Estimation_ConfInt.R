setwd("C:\\Users\\Flor\\OneDrive\\DailyCodingProblems\\Pi_Estimation_MonteCarlo")

library(R.matlab)

pi_est<-readMat("pi_est.mat")

hist(pi_est$pi.est)
#check for normal distribution

shapiro.test(pi_est$pi.est) #with a lot of data shapiro's test can be a bit sensitive
qqnorm(pi_est$pi.est) #qqplot looks fine

qnorm(2.5/100,mean(pi_est$pi.est),sd(pi_est$pi.est)) # 2.75 percentile

qnorm(97.5/100,mean(pi_est$pi.est),sd(pi_est$pi.est)) # 97.25 percentile

t.test(pi_est$pi.est)$"conf.int"
