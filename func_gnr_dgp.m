function dgp_Y = func_gnr_dgp(beta,gamma,rho,X,network,Err,Y)
    [T,N] = size(Y);
    I = eye(N);
    for i = 1:T
        A = I-rho*network;
        B = beta*X(i,:)'+network*gamma*X(i,:)'+Err(i,:)';
%     B = B';
        Y(i,:) = linsolve(A,B)';    
    end
    dgp_Y = Y;
end
