function rnd_W = gnr_rnd_network(N)
    rnd_W = zeros(N);
    rd = randi(9,N,1);
    for i = 1:N
        if i~=rd(i)
            rnd_W(i,rd(i)) = 1;
        else
           rnd_W(i,rd(i+1))=1;
        end
    end
end