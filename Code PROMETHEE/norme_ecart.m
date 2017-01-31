function [liste_norme,liste_individus_taub_1]=norme_ecart()

%renvoie une liste contenant la différence de norme entre les individus de
%la dernière génération qui ont un tau-b de 1 et la norme de la matrice de
%données, dans le cas dégénéré.

NBRE_PROFILS_PAR_INDIVIDU=30; % car ici on considère le cas dégénéré

[~,~,~,liste_taub_complete,liste_individus_complete,iteration]=test_algo_genetique(NBRE_PROFILS_PAR_INDIVIDU);

taub_derniere_gen=liste_taub_complete{iteration};
individus_derniere_gen=liste_individus_complete{iteration};

liste_individus_taub_1={};  %cellule de listes
liste_norme=[];  %liste

j=0;
for i=1:length(taub_derniere_gen)
    if taub_derniere_gen(i)==1
        j=j+1;
        temp=individus_derniere_gen{i}
        norme_temp=norm(temp);
        liste_norme(j,1)=norme_temp;
        liste_individus_taub_1{j,1}=temp;
    end
end

    