function obj_gmm_lasso2 = func_gmm_lasso_stage_two_slack(x,Y,X,p11,x_stage_one)
% FUNC_GMM_LASSO_STAGE_ONE_SLACK add the penalty function and gmm function
% together
%
% Syntax: obj_gmm_lasso1 = func_gmm_lasso_stage_one_slack(x,Y,X,p1)
%
% Inputs:
%   x - a list of N*(N-2)+3 elements, the last three elements are (rho,gamma,beta)
%   Y - dependent variables
%   X - explanatory variables
%   p1 - regularisation parameter
%   estimate_slack_var - 
%
% Outputs:
%   obj_gmm_lasso1 - the penalised GMM function with the L-1 penalty
%
    shape = size(X);
%     T = shape(1);
    N = shape(2);
    estimate_slack_var = x_stage_one(N*(N-2)+1:end-3);
    obj_gmm_lasso2 = func_gmm_stage_two_slack(x,Y,X,x_stage_one) + func_lasso_stage_two_slack(x,Y,X,p11,estimate_slack_var);
end 