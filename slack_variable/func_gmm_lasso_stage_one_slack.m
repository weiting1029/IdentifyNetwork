function obj_gmm_lasso1 = func_gmm_lasso_stage_one_slack(x,Y,X,p1)
    obj_gmm_lasso1 = func_gmm_slack(x,Y,X) + func_lasso_stage_one_slack(x,Y,X,p1);
end 