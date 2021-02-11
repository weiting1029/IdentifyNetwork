function [x, fval] = func_min_pen_obj(obj_fun,x0)
options = optimoptions(@fmincon,'Algorithm','sqp','Display','off');
[n, ~] = size(x0);
lb = zeros([n,1]);
lb(end) = -5;
lb(end-1) = -5;
% ub = ones([n,1])*inf;

[x, fval] = fmincon(obj_fun,x0,[],[],[],[],lb,[],[],options);

end 