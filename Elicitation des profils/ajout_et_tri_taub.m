function [taub_conca_triee,p_e_conca_triee]=ajout_et_tri_taub(taub_parents,taub_enfants,liste_parents,liste_enfants)
%CONCATENE ET TRIE LES PARENTS ET ENFANTS (ET LEUR TAUB) SUR BASE DU TAUB

%conca=concatenee
%p_e=parents_enfants
%listes COLONNES
%LES LISTES TAUB_PARENTS ET TAUB_ENFANTS SONT CONSIDEREES COMME TRIEES PAR ODRE DECROISSANT AU
%DEPART

[n_enfants,~]=size(taub_enfants);

taub_conca_triee=taub_parents;
p_e_conca_triee=liste_parents;
p_e=liste_parents;

for i=1:n_enfants
    j=1;
    while (taub_enfants(i)<taub_conca_triee(j))&&(j<length(taub_conca_triee))
        j=j+1;
    end
    
    %insertion
    p_e=cell((length(p_e)+1),1); %élongation de p_e
    
    if j~=length(taub_parents)
        taub_conca_triee=[taub_conca_triee(1:(j-1));taub_enfants(i);taub_conca_triee(j:end)];
        p_e=[p_e_conca_triee(1:(j-1));liste_enfants(i);p_e_conca_triee(j:end)];
    else
        taub_conca_triee=[taub_conca_triee(1:(j-1));taub_enfants(i)];
        p_e=[p_e_conca_triee(1:(j-1));liste_enfants(i)];
    end
    p_e_conca_triee=p_e;
    
end

        

