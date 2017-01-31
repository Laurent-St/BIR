function flux_net=flux_net(i,evaluations_i,evaluations_j,q,p,s,choosed_preference_function,weights)
    flux_net=flux_sortant(i,evaluations_i,evaluations_j,q,p,s,choosed_preference_function,weights)-flux_entrant(i,evaluations_i,evaluations_j,q,p,s,choosed_preference_function,weights);
    
    