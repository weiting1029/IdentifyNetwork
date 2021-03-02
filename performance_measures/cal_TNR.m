function TNR = cal_TNR(est_wlist,true_wlist)
    check_list = est_wlist+true_wlist;
    nr_total_zeros = length(check_list)-nnz(check_list);
    nr_true_zeros = length(true_wlist)-nnz(true_wlist);
    TNR = nr_total_zeros/nr_true_zeros;
end 