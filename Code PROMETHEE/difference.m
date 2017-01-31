function d=difference(f,i,j,evaluations_i,evaluations_j) %f est le numéro du critère
    %datafile;
    D_i=evaluations_i;
    D_j=evaluations_j;
    f_ai=D_i(i,f);
    f_aj=D_j(j,f);
    d=f_ai-f_aj;
end
    
    