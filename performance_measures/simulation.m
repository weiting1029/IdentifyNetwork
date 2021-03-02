function [MSE,TPR,TNR] = simulation(beta0,gamma0,rho0,X,rd_network1,k,Y,p1)
    [T,N] = size(Y);
    MSE = 0;
    TPR = 0;
    TNR = 0;
    I = eye(N);
    zero = zeros([N,1]);
    x_true = zeros([N*(N-2)+3,1]);
    x_true(end-2:end) = [rho0,gamma0,beta0];
    x_true(1:end-3) = func_remove_diag(rd_network1,N);
    x_initial_slack = [x_true(1:end-3);x_true(1:end-3);0;0;0];
    for i = 1:k
        Err = mvnrnd(zero,I,T);    
        Y = func_gnr_dgp(beta0,gamma0,rho0,X,rd_network1,Err,Y);
        f_min_gmm_slack = @(x)func_gmm_lasso_stage_one_slack(x,Y,X,p1);
        [x_gmm_slack, ~] = func_min_pen_obj_slack(f_min_gmm_slack,x_initial_slack,N);
        estimate_scalar_slack = x_gmm_slack(end-2:end);
        estimate_wlist_slack = x_gmm_slack(1:N*(N-2));
        est_para = [estimate_wlist_slack;estimate_scalar_slack];
        MSE = MSE + cal_MSE(est_para,x_true);
        TPR = TPR + cal_TPR(estimate_wlist_slack,x_true(1:end-3));
        TNR = TNR + cal_TNR(estimate_wlist_slack,x_true(1:end-3));       
    end
    MSE = MSE/k;
    TPR = TPR/k;
    TNR = TNR/k;
end 