function elsn1 = elsn_stage_one(x,p1,p2)
    Wlist = x(1:end-3);
    elsn1 = p1*sum(abs(Wlist))+p2*sumsqr(Wlist);
end 