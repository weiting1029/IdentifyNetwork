function TPR = cal_TPR(est_wlist,true_wlist)
%     nr_elements = length(true_wlist);
    check_list = est_wlist.*true_wlist;
    nr_total_nonzeros = nnz(check_list);
    nr_ture_nonzeros = nnz(true_wlist);
    TPR = nr_total_nonzeros/nr_ture_nonzeros;
end 