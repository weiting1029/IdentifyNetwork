function [obj_GCV,obj_p1] = func_GCV_LASSO(p1_can,N,T,X,Y)
    obj_GCV = 100000;
    obj_p1 = p1_can(1);
    for i = 1:length(p1_can)
        p1 = p1_can(i);
        x_initial = zeros([N*(N-2)+3,1]);
%         x_initial(1:end-3) = zeros([N*(N-2),1]);
%         x_initial(end-2:end)= 0;
        x_initial_slack = [x_initial(1:end-3);x_initial(1:end-3);x_initial(end-2:end)];
        f_min_gmm_slack = @(x)func_gmm_lasso_stage_one_slack(x,Y,X,p1);
        [x_gmm_slack, obj_gmm_slack] = func_min_pen_obj_slack(f_min_gmm_slack,x_initial_slack,N);
        estimate_wlist_slack = x_gmm_slack(1:N*(N-2));
        estimate_N = nnz(estimate_wlist_slack);
        can_gcv_function = log10(obj_gmm_slack)+estimate_N*log10(T)/T;
        if (can_gcv_function<=obj_GCV)      
            obj_GCV = can_gcv_function;
            obj_p1 = p1;
        end
    end
end 