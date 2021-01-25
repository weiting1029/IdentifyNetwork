function W = reconstruct(Wlist,N)
    Wlist = Wlist';
    Wlist = [0 Wlist];
    for i = 2:N
        temp = (i-1)*(N+1);
        Wlist = [Wlist(1:temp) 0 Wlist(temp+1:end)];
    end
    W = reshape(Wlist,N,N);
end