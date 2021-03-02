     function W = func_reconstruct(Wlist,N)
    temp_wmatrix = reshape(Wlist,[N-2,N]);
    temp_wmatrix = temp_wmatrix';
    Wlist = Wlist';
    Wlist = [0 1-sum(temp_wmatrix(1,:)) Wlist];
    for i = 2:N
        temp = (i-1)*(N+1)-1;
        Wlist = [Wlist(1:temp) 1-sum(temp_wmatrix(i,:)) 0  Wlist(temp+1:end)];
    end
    W = reshape(Wlist,[N,N]);
    W = W';
end