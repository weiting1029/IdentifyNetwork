function obj_gmm_lasso1 = func_gmm_lasso_stage_one_slack(x,Y,X,p1)
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
%
% Outputs:
%   obj_gmm_lasso1 - the penalised GMM function with the L-1 penalty
%
%

    obj_gmm_lasso1 = func_gmm_slack(x,Y,X) + func_lasso_stage_one_slack(x,Y,X,p1);
end 