function flux_entrant=flux_entrant(i,evaluations_i,evaluations_j,q,p,s,choosed_preference_function,weights)
    datafile;
    [lines,columns]=size(evaluations_j);   %lines est le nombre n d'alternatives
    flux_entrant=0;
    for j=1:lines
        flux_entrant=flux_entrant+degre_pref(j,i,q,p,s,choosed_preference_function,weights,evaluations_j,evaluations_i);
    end
    flux_entrant=flux_entrant/(lines-1);
end
