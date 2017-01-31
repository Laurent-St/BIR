function flux_sortant=flux_sortant(i,evaluations_i,evaluations_j,q,p,s,choosed_preference_function,weights)
    %datafile;
    [lines,columns]=size(evaluations_j);   %lines est le nombre n d'alternatives
    flux_sortant=0;
    for j=1:lines
        flux_sortant=flux_sortant+degre_pref(i,j,q,p,s,choosed_preference_function,weights,evaluations_i,evaluations_j);
    end
    flux_sortant=flux_sortant/(lines-1);
    
end