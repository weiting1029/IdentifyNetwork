function obj_gmm_lasso1 = gmm_lasso_stage_one(x,Y,X,p1)
    obj_gmm_lasso1 = gmm(x,Y,X) + lasso_stage_one(x,p1);
end 