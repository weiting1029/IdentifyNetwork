function lasso2 = func_lasso_stage_two_slack(x,~,X,p11,estimate_slack_var)
%FUNC_LASSO_STAGE_ONE_SLACK define the penalised term for simple LASSO
%
%Syntax: lasso1 = func_lasso_stage_one_slack(x,~,X,p1)
%
%Inputs:
%   x - a list of N*(N-2)+3 elements, the last three elements are (rho,gamma,beta)
%   ~ - dependent variables
%   X - explanatory variables
%   p1 - regularisation parameter
%
%Outputs
%   lasso1 - the simple lasso term
    gamma = 2.5;
    shape = size(X);
    N = shape(2);
%     Wlist = x(1:N*(N-2));
    slack_var = x(N*(N-2)+1:end-3);
    adaptive_weights = 1/(abs(estimate_slack_var).^gamma);
    lasso2 = p11*sum(slack_var.*adaptive_weights); 
end 