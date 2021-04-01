function obj_gmm_slack_s2 = func_gmm_stage_two_slack(x,Y,X,x_stage_one)
%FUNC_GMM_SLACK construct the unpenalised gmm function
%
%Syntax: obj_gmm_slack = func_gmm_slack(x,Y,X)
%
%Inputs:
%   x - a list of N*(N-2)+3 elements, the last three elements are (rho,gamma,beta)
%   Y - dependent variables
%   X - explanatory variables
%   x_stage_one - parameters estimated in stage one
%Outputs:
%   obj_gmm_slack - the objective value of the unpenalised gmm unction
%
    shape = size(X);
    T = shape(1);
    N = shape(2);
    I = eye(N);
    rho = x(end-2);
    gamma = x(end-1);
    beta = x(end);
    n = (length(x)-3)/2;
    Wlist = x(1:n);
    estimate_wlist = x_stage_one(1:n);
%     slack_var = x(N*(N-2)+1:end-3);
    W = func_reconstruct_stage2(Wlist,N,estimate_wlist);
    ERR = (I-rho*W)*Y'-(beta*I+gamma*W)*X';
    ERR = ERR';
    gnt = zeros(N*N,1);    
    for j = 1:T
        temp = ERR(j,:)'*X(j,:);
        gnt = gnt + reshape(temp,N*N,1);
    end
    Weight = eye(N*N);
    obj_gmm_slack_s2 = gnt'*Weight*gnt/T;
end 
