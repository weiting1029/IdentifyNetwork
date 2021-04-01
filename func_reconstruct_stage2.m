function W_stage2 = func_reconstruct_stage2(Wlist_stage2,N,estimate_Wlist)

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
extended_list = zeros([length(estimate_Wlist),1]);
extended_list(estimate_Wlist~=0)=Wlist_stage2;
W_stage2 = func_reconstruct(extended_list,N);
% 
% 
%     W_stage2 = zeros([N*N,1]);
% %     W_stage2 = W_stage2(:);
%     W_old =func_reconstruct(estimate_Wlist,N);
%     W_old_list = W_old(:);
% %     W_stage2(W_old_list~=0)=Wlist_stage2;
%     test = W_stage2(W_old_list~=0);
%     W_stage2 = reshape(W_stage2,[N,N]);
% %     temp_wmatrix = reshape(Wlist_stage2,[N-2,N]); 
% %     temp_wmatrix = temp_wmatrix';
% %     Wlist = Wlist';
% %     Wlist = [0 1-sum(temp_wmatrix(1,:)) Wlist];
% %     for i = 2:N
% %         temp = (i-1)*(N+1)-1;
% %         Wlist = [Wlist(1:temp) 1-sum(temp_wmatrix(i,:)) 0  Wlist(temp+1:end)];
% %     end
% %     W = reshape(Wlist,[N,N]);
% %     W = W';
end