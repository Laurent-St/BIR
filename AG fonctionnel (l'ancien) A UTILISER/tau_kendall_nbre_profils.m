function liste_tau=tau_kendall_nbre_profils(NBRE_PROFILS_PLUS_1)
%calcule le tau de kendall entre P2 et P-référencé en fonction du nbre de
%profils (chaque fois pour 100 valeurs aléatoires) et affiche ça sur un graphe 

script_ranking;
ranking_p2=ranking_eq;  %ranking trié Anh Vu

liste_tau=zeros(1,NBRE_PROFILS_PLUS_1-1);

for i=1:NBRE_PROFILS_PLUS_1-1
    liste_temp=zeros(1,100);
    for j=1:100
        liste_temp(1,j)=kendall_p2_p_reference(i+1);
    end
    liste_tau(1,i)=mean(liste_temp);
end
    