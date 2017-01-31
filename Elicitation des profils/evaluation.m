function [liste_taub_triee,indices_tri_taub,individu_taub_max,taub_max]=evaluation(liste_parents,contraintes)

%contrainte est une matrice à x lignes et 2 colonnes (x étant le nbre de "questions"
%dans la fonction questions_et_profils.
%Chaque ligne a 2 entrées: la première est l'indice de l'alternative préférée,
%et la 2e est l'indice de l'alternative non préférée.

%un invidu ne respectant pas une contrainte se verra attribuer un taub de
%zéro.

%liste_parents est un cellule verticale de listes

%critère d'évaluation: tau-b de Kendall
script_ranking
flux_p2=flux_non_trie;

% liste_parents_restant={};   %va être une cellule de listes

[lignes,~]=size(liste_parents);

[nbre_contraintes,~]=size(contraintes);

% j=0;
% indice_taub_max=1;
% taub_precedent=0;  %artifice pour initialiser la recherche du taub_max

% compteur_condition=0;   %va servir à durcir de plus en plus la condition sur taub

liste_taub=zeros(lignes,1);  %va etre une liste VERTICALE des taub qui va etre triee avec les indices

for i=1:lignes
    [a,~]=size(liste_parents{i,1}); %le a n'a pas d'importance
    [flux_p_reference,~,ranking]=tri_vers_ranking(a,2,liste_parents,i);
    
    check_contrainte=1; %utilisé pour voir s'il faut calculer le taub ou pas après la verification
    for j=1:nbre_contraintes
        indice_alt_1=contraintes(j,1);
        indice_alt_2=contraintes(j,2);
        
        %recherche de la position de alt_1 et 2 dans le classement p_ref
        res=false;
        k=1;
        while k<=length(ranking)&&(res==false)
            res=(ranking(k)==indice_alt_1);
            k=k+1;
        end
    
        res=false;
        kk=1;
        while kk<=length(ranking)&&(res==false)
            res=(ranking(kk)==indice_alt_2);
            kk=kk+1;
        end
        
        %verification de la contrainte: si elle n'est pas vérifiée alors on met
        %un tau-b de 0 pour être sûr de l'éliminer. Pour qu'elle soit
        %vérifiée il faut que k<kk car alt_1 est préférée à alt_2 (c'est la
        %convention qu'on a défini dans la fct questions_et_profils):
        
        if k>kk %dans ce cas la condition n'est pas vérifiée
            taub=0;
            check_contrainte=0; %pour dire de ne pas calculer le taub si contrainte non vérifiée
            break %on sort du for car si une contrainte n'est pas vérifiée, pas besoin de checker les autres
        end
    end
    
    if (check_contrainte==1) %cad si toutes les contraintes sont respectées
        [taub,~,~,~,~,~,~,~,~,~,~,~,~,~,~,~]=ktaub([flux_p2 flux_p_reference],0.1,0);
    end
    liste_taub(i,1)=taub;
end

disp('Evaluation terminee');

[liste_taub_triee,indices_tri_taub]=sort(liste_taub,'descend');  %comme dans script_ranking
%INDICES EST UNE LISTE VERTICALE

% [nombre_alternatives_donnees_initiales,~]=size(donnees);

% for j=1:round(nombre_alternatives_donnees_initiales/4)
%     liste_parents_restant{j,1}=liste_parents{indices(j,1),1};
% end

indice_max=indices_tri_taub(1,1);
individu_taub_max=liste_parents{indice_max,1};

taub_max=liste_taub_triee(1,1);






    
    
    
    
%     if taub>(0.75+compteur_condition)
%         j=j+1;
%         liste_parents_restant{j,1}=liste_parents{i,1};
%         individu_taub_max=0;
%     end
%     if taub>taub_precedent
%         indice_taub_max=i;
%     end
%     taub=taub_precedent;
%     compteur_condition=compteur_condition+0.002;
        




%     elseif taub==1
%         disp('TAU-B DE 1 TROUVE')
%         individu_taub_max=liste_parents{i,1}
%         %ARRETER L'ALGORITHME
%end

% [flux_p_reference_taub_max,~,~]=tri_vers_ranking(a,2,liste_parents,indice_taub_max);
% [taub_max,~,~,~,~,~,~,~,~,~,~,~,~,~,~,~]=ktaub([flux_p2 flux_p_reference],0.1,0);
% 
% individu_taub_max=liste_parents{indice_taub_max,1};
        
        
    
    
    
    
