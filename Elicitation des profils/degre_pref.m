function deg_pref=degre_pref(i,j,q,p,s,choosed_preference_function,weights,evaluations_i,evaluations_j)
    %datafile;
    deg_pref=0;
    if choosed_preference_function==2
        for k=1:length(weights)
            deg_pref=deg_pref+(weights(1,k)*fct_pref2(q,difference(k,i,j,evaluations_i,evaluations_j)));
        end
    elseif choosed_preference_function==5
        for k=1:length(weights)
            deg_pref=deg_pref+(weights(1,k)*fct_pref5(q,p,difference(k,i,j,evaluations_i,evaluations_j)));
        end
    else
        for k=1:length(weights)
            deg_pref=deg_pref+(weights(1,k)*fct_pref6(s,difference(k,i,j,evaluations_i,evaluations_j)));
        end
    end
end
            