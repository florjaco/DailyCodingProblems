% # This problem was asked by Google.
% 
% # The area of a circle is defined as ?r^2. Estimate ? to 3 decimal places using a Monte Carlo method.


for i=1:5000
% tic; 
pi_est(i) = Estimate_Pi_MonteCarlo(10000); 
% toc;
end
hist(pi_est,50)

save('pi_est.mat','pi_est')
