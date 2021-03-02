function obj_gmm_elsn1 = func_gmm_elsn_stage_one(x,Y,X,p1,p2)
    obj_gmm_elsn1 = func_gmm(x,Y,X) + func_elsn_stage_one(x,p1,p2);
end 