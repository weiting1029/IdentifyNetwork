function lasso1 = func_lasso_stage_one_slack(x,~,X,p1)
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
    shape = size(X);
    N = shape(2);
    Wlist = x(1:N*(N-2));
    slack_var = x(N*(N-2)+1:end-3);
    lasso1 = p1*sum(slack_var); 
end 