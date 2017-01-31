function [nbre_profils,liste_profils]=algo_genetique(donnees)
%un parent/solution est un ensemble de profils de référence.

%donnees est une matrice n x q de n alternatives selon q critères

PROBA_CROISEMENT=0.5;
[n,q]=size(donnees);
mini=min(min(donnees));
maxi=max(max(data));

%première génération des parents: sélection aléatoire d'alternatives dans
%les données
liste_parents=choix_profils_pour_algo_genetique(donnees);
%évaluation des parents: sur base du tau-b entre P-II et P-référencé

    

%croisements

[a,~]=size(liste_parents)
for j=1:a
    nbre_random=randint(1,1);
    if nbre_random<PROBA_CROISEMENT  %alors il y a croisement
        
        
    


    

    