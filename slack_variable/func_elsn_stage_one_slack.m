function elsn1 = func_elsn_stage_one_slack(x,~,X,p1,p2)
%     Wlist = x(1:end-3);
    shape = size(X);
%     T = shape(1);
    N = shape(2);
    Wlist = x(1:N*(N-2));
    slack_var = x(N*(N-2)+1:end-3);
    elsn1 = p1*sum(slack_var)+p2*sum(Wlist.*Wlist);
end 