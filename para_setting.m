
% global constant variables
k = 500;
N=10;% number of individuals
T=100;% time horizon
rho0=0.3;
beta0=0.4;
gamma0=0.5;
I = eye(N);
unit = ones([N,1]);
zero = zeros([N,1]);

% generate time-fixed effects
mu = 1;
sigma = 1;
alpha0 = normrnd(mu,sigma,[N,1]);

% general individual fixed effects
alpha1 = mvnrnd(unit,I);


%exogeneous variables 
X = mvnrnd(zero,I,T);
Err = mvnrnd(zero,I,T);





