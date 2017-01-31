%script tri vers ranking  ---> fait donc appel à un autre fichier de
%données constitué cette fois des profils types (de référence) et à
%d'autres arguments dans la fonction de calcul de flux.

function [flux_non_trie,flux,ranking]=tri_vers_ranking(NBRE_PROFILS_PLUS_1,type_jeu_donnees,liste_parents,indice_parent)

% si TYPE_DE_JEU_DE_DONNEES=1: profils aléatoires avec la fonction
% calculs_profils
%si TYPE_DE_JEU_DE_DONNEES=2: profils calculés avec la fonction
%choix_profils_pour_algo_genetique

%indice_parent indice du parent (ensemble de profils) dans la
%liste_parents pour l'algo génétique

%SI PAS ALGO GENETIQUE ALORS LES 2 DERNIERS ARGUMENTS SONT INUTILES (on
%peut mettre ce qu'on veut)

datafile;
%datafile_ref;   % !!!_ref

if type_jeu_donnees==1
    evaluations_ref=calcul_profils(NBRE_PROFILS_PLUS_1);
else
    evaluations_ref=liste_parents{indice_parent,1};
end

[lines,columns]=size(evaluations);
%flux_list=zeros(1,lines); %crée un LIGNE de zéros
flux_list=zeros(lines,1); %crée une colonne de zéros
for i=1:lines
    evaluations_ref_copy = [evaluations_ref; evaluations(i,:)];
    [ref_lines,ref_columns] = size(evaluations_ref_copy);
    for ii=1:ref_lines
        flux_list(i,1)=flux_net(ii,evaluations_ref_copy,evaluations_ref_copy,q,p,s,choosed_preference_function,weights);
    end
end
flux_non_trie=flux_list;
[flux,ranking]=sort(flux_list,'descend');

%ranking_names=alternatives{ranking}

 ranking=reshape(ranking,[1 length(ranking)]);
% for value=ranking
%     disp(alternatives{value})
% end

flux_transfo_lineaire=(flux+1)*50;

%bar(flux_transfo_lineaire);    %affiche un diagramme en batonnets

