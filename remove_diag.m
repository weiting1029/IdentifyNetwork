function W_no_dig = remove_diag(W,N)
    W_no_dig = W;
    W_no_dig = W_no_dig(:);
    indices = 1:N+1:length(W_no_dig);
    W_no_dig(indices) = [];
end