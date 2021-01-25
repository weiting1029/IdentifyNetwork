
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



%generate random network
rd_network1 = gnr_rnd_network(N);
x_true = zeros([N*(N-1)+3,1]);
x_true(end-2:end) = [rho0,gamma0,beta0];
x_true(1:end-3) = remove_diag(rd_network1,N);



%data generating process
Y = zeros([T,N]);
for i = 1:T
    A = I-rho0*rd_network1;
    B = beta0*X(i,:)+X(i,:)*rd_network1*gamma0+Err(i,:);
    B = B';
    Y(i,:) = linsolve(A,B);
end

%estimation
p1 = 1;
x_initial = x_true;
x_initial(end-2:end) =0;
% x_initial = x_initial';
f_min_gmm = @(x)gmm_lasso_stage_one(x,Y,X,p1);
[x_gmm, obj_gmm] = min_pen_obj(f_min_gmm,x_initial);





















