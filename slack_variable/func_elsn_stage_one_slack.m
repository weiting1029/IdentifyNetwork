function elsn1 = func_elsn_stage_one_slack(x,~,X,p1,p2)
% FUNC_ELSN_STAGE_ONE_SLACK define the penalised term for simple elastic
% net
% 
% Syntax: elsn1 = func_elsn_stage_one_slack(x,~,X,p1,p2)
% Inputs:
%   x - a list of N*(N-2)+3 elements, the last three elements are (rho,gamma,beta)
%   Y - dependent variables
%   X - explanatory variables
%   p1 - regularisation parameter for the l1 term
%   p2 - regularisation parameter for the l2 term
%
%   
% Outputs: 
%   elsn1 - the elastic net penalty term 
%


%     Wlist = x(1:end-3);
    shape = size(X);
%     T = shape(1);
    N = shape(2);
    Wlist = x(1:N*(N-2));
    slack_var = x(N*(N-2)+1:end-3);
    elsn1 = p1*sum(slack_var)+p2*sum(Wlist.*Wlist);
end 