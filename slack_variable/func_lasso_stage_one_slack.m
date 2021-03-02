function lasso1 = func_lasso_stage_one_slack(x,~,X,p1)
    shape = size(X);
    N = shape(2);
    Wlist = x(1:N*(N-2));
    slack_var = x(N*(N-2)+1:end-3);
    lasso1 = p1*sum(slack_var); 
end 