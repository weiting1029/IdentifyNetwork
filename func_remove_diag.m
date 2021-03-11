function W_no_dig = func_remove_diag(W,N)
% FUNC_REMOVE_DIAG remove the diagnal and off-diagnal elements from the
% weighted matrix W and flatten it, row-wise
%
% Syntax:  W_no_dig = func_remove_diag(W,N)
%
%Inputs：
%   W - network (weight matrix_
%   N - number of individuals 
%
%Outputs:
%   W_no_diag - a list of the elements of W after removing the diagonal elements and
%   off-diagonal elements, N*(N-2)
%

    W_no_dig = W';
    W_no_dig = reshape(W_no_dig,[N*N,1]);
    indices = 1:N+1:length(W_no_dig);
    W_no_dig(indices) = []; 
    indices2 = N:N:length(W_no_dig);
    W_no_dig(indices2) = [];
    W_no_dig(1) = [];
end