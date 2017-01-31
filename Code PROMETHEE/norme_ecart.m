function [liste_norme,liste_individus_taub_1]=norme_ecart()

%renvoie une liste contenant la diff�rence de norme entre les individus de
%la derni�re g�n�ration qui ont un tau-b de 1 et la norme de la matrice de
%donn�es, dans le cas d�g�n�r�.

NBRE_PROFILS_PAR_INDIVIDU=30; % car ici on consid�re le cas d�g�n�r�

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

    