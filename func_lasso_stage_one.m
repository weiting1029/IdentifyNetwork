function lasso1 = func_lasso_stage_one(x,p1)
    Wlist = x(1:end-3);
    lasso1 = p1*sum(Wlist); 
end 