function W_no_dig = func_remove_diag(W,N)
    W_no_dig = W';
    W_no_dig = reshape(W_no_dig,[N*N,1]);
    indices = 1:N+1:length(W_no_dig);
    W_no_dig(indices) = []; 
    indices2 = N:N:length(W_no_dig);
    W_no_dig(indices2) = [];
    W_no_dig(1) = [];
end