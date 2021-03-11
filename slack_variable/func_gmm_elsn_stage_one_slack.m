function obj_gmm_elsn1 = func_gmm_elsn_stage_one_slack(x,Y,X,p1,p2)
% FUNC_GMM_LASSO_STAGE_ONE_SLACK add the penalty function and gmm function
% together
%
% Syntax: obj_gmm_elsn1 = func_gmm_elsn_stage_one_slack(x,Y,X,p1,p2)
%
% Inputs:
%   x - a list of N*(N-2)+3 elements, the last three elements are (rho,gamma,beta)
%   Y - dependent variables
%   X - explanatory variables
%   p1 - regularisation parameter for the l1 term
%   p2 - regularisation parameter for the l2 term
%
%
% Outputs:
%   obj_gmm_elsn1 - the penalised GMM function with the elastic net penalty

    obj_gmm_elsn1 = func_gmm_slack(x,Y,X) + func_elsn_stage_one_slack(x,Y,X,p1,p2);
end 