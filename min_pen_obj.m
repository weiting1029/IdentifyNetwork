function [x, fval] = min_pen_obj(obj_fun,x0)

[n, ~] = size(x0);
lb = zeros([n,1]);
lb(end) = -inf;
lb(end-1) = -inf;
ub = ones([n,1])*inf;

[x, fval] = fmincon(obj_fun,x0,[],[],[],[],lb,ub);

end 