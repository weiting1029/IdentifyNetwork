
% global constant variables
k = 500;
N=5;% number of individuals
T=1000;% time horizon
rho0=0.3;
beta0=0.4;
gamma0=0.5;
I = eye(N);
unit = ones([N,1]);
zero = zeros([N,1]);
 

%control rd generator
rng(100);


% generate time-fixed effects
mu = 1;
sigma = 1;
alpha0 = normrnd(mu,sigma,[N,1]);

% general individual fixed effects
alpha1 = mvnrnd(unit,I);


%exogeneous variables 
X = mvnrnd(zero,I,T);
Err = mvnrnd(zero,I,T);



%generate random network
rd_network1 = func_gnr_rnd_network(N);
x_true = zeros([N*(N-1)+3,1]);
x_true(end-2:end) = [rho0,gamma0,beta0];
x_true(1:end-3) = func_remove_diag(rd_network1,N);



%data generating process
Y = zeros([T,N]);
Y = func_gnr_dgp(beta0,gamma0,rho0,X,rd_network1,Err,Y);

%estimation
p1 = 0.5;
x_initial = x_true;
x_initial(end-2:end)= 0;
% x_initial = x_initial';
f_min_gmm = @(x)func_gmm_lasso_stage_one(x,Y,X,p1);
[x_gmm, obj_gmm] = func_min_pen_obj(f_min_gmm,x_initial);
estimate_scalar = x_gmm(end-3:end);
estimate_wlist = x_gmm(1:end-3);
estimate_network = func_reconstruct(estimate_wlist,N);





















