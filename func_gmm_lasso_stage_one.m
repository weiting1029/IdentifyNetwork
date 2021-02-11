function obj_gmm_lasso1 = gmm_lasso_stage_one(x,Y,X,p1)
    obj_gmm_lasso1 = func_gmm(x,Y,X) + func_lasso_stage_one(x,p1);
end 