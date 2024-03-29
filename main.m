
% global constant variables
k = 10;
N=10;% number of individuals
T=100;% time horizon 
rho0=0.4;% endogenous social effect
beta0=0.8;% measures sensitivity to its own characteristic
gamma0=0.5;% exogenous social effect
I = eye(N);
unit = ones([N,1]);
zero = zeros([N,1]);
 

%control random generator
rng(1000);


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
x_true = zeros([N*(N-2)+3,1]);
x_true(end-2:end) = [rho0,gamma0,beta0];
x_true(1:end-3) = func_remove_diag(rd_network1,N);




%%%%%%%%%%%data generating process%%%%%%%%%%%%%%%%%
Y = zeros([T,N]);
Y = func_gnr_dgp(beta0,gamma0,rho0,X,rd_network1,Err,Y);




% %%%%%%%STAGE-ONE-GCV%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% p1_can = 10:2:50;
% [obj_GCV,obj_p1] = func_GCV_LASSO(p1_can,N,T,X,Y);

% % 
%%%%%%%%%%%%%LASSO-Stage-One-Estimation%%%%%%%%%%%%%%%%%%%%%%%%%%
p1 = obj_p1;
% p2 = 100;
rng(1)
test = func_gnr_rnd_network(N);
x_initial = x_true;
% x_initial(1:end-3) = func_remove_diag(test,N);
x_initial(1:end-3) = zeros([N*(N-2),1]);
x_initial(end-2:end)= 0;
% x_initial = x_initial';

% 
% f_min_gmm = @(x)func_gmm_lasso_stage_one(x,Y,X,p1);
% [x_gmm, obj_gmm] = func_min_pen_obj(f_min_gmm,x_initial);
% estimate_scalar = x_gmm(end-2:end);
% estimate_wlist = x_gmm(1:end-3);
% estimate_network = func_reconstruct(estimate_wlist,N);
% 

x_initial_slack = [x_initial(1:end-3);x_initial(1:end-3);x_initial(end-2:end)];
f_min_gmm_slack = @(x)func_gmm_lasso_stage_one_slack(x,Y,X,p1);
[x_gmm_slack, obj_gmm_slack] = func_min_pen_obj_slack(f_min_gmm_slack,x_initial_slack,N);
x_gmm_slack(abs(x_gmm_slack)<=0.01)=0;
estimate_scalar_slack = x_gmm_slack(end-2:end);
estimate_wlist_slack = x_gmm_slack(1:N*(N-2));
% estimate_wlist_slack(abs(estimate_wlist_slack)<=0.01)=0;
estimate_network_slack= func_reconstruct(estimate_wlist_slack,N);
% estimate_slack_var = x_gmm_slack(N*(N-2)+1:end-3);






% % %%%%%%%STAGE-TWO-GCV%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% p11_can = 1:1:10;
% [obj_GCV,obj_p11] = func_GCV_LASSO_S2(p11_can,N,T,X,Y,estimate_slack_var);
% 


%%%%%%%STAGE TWO ESTIMATION%%%%%%%%%%%%%%%%%%%%%%%%
x_initial_slack_stage2 = zeros([nnz(estimate_wlist_slack)*2+3,1]);
estimate_slack_var = x_gmm_slack(N*(N-2)+1:end-3);
estimate_slack_var(estimate_slack_var==0)=[];
f_min_gmm_slack_stage2= @(x)func_gmm_lasso_stage_two_slack(x,Y,X,obj_p11,x_gmm_slack);
[x_gmm_slack_stage2, obj_gmm_slack_stage2] = func_min_pen_obj_slack(f_min_gmm_slack_stage2,x_initial_slack_stage2,N);
estimate_scalar_slack_stage2 = x_gmm_slack_stage2(end-2:end);
estimate_wlist_slack_stage2 = x_gmm_slack_stage2(1:N*(N-2));
estimate_network_slack_stage2 = func_reconstruct(estimate_wlist_slack_stage2,N);
% estimate_slack_var = x_gmm_slack(N*(N-2)+1:end-3);






















