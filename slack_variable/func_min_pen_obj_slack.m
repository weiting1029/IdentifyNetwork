function [x, fval] = func_min_pen_obj_slack(obj_fun,x0,N)
options = optimoptions(@fmincon,'Algorithm','active-set','Display','off');
[n, ~] = size(x0);
lb = zeros([n,1]);
lb(end) = -5;
lb(end-1) = -5;
temp_n = N*(N-2);
A = zeros([2*temp_n,n]);
b = zeros([2*temp_n,1]);
for i = 1:temp_n
    A(i,i) = -1;
    A(i,i+temp_n)=-1;
    A(i+temp_n,i)=1;
    A(i+temp_n,i+temp_n)=-1;
end
    
    
    
    
% ub = ones([n,1])*inf;
[x, fval] = fmincon(obj_fun,x0,A,b,[],[],lb,[],[],options);
  
end 