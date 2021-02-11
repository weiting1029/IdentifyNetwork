function rnd_W = func_gnr_rnd_network(N)
    rnd_W = zeros(N);
    rd = randi(N-1,N,1);
    for i = 1:N
        if i~=rd(i)
            rnd_W(i,rd(i)) = 1;
        else
           rnd_W(i,rd(i+1))=1;
        end
    end
end