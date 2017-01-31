function [liste_taub_triee,indices_tri_taub,individu_taub_max,taub_max]=evaluation(liste_parents)


%liste_parents est un cellule verticale de listes

%critère d'évaluation: tau-b de Kendall
script_ranking
flux_p2=flux_non_trie;

% liste_parents_restant={};   %va être une cellule de listes

[lignes,~]=size(liste_parents);

% j=0;
% indice_taub_max=1;
% taub_precedent=0;  %artifice pour initialiser la recherche du taub_max

% compteur_condition=0;   %va servir à durcir de plus en plus la condition sur taub

liste_taub=zeros(lignes,1);  %va etre une liste VERTICALE des taub qui va etre triee avec les indices

for i=1:lignes
    [a,~]=size(liste_parents{i,1}); %le a n'a pas d'importance
    [flux_p_reference,~,~]=tri_vers_ranking(a,2,liste_parents,i);
    [taub,~,~,~,~,~,~,~,~,~,~,~,~,~,~,~]=ktaub([flux_p2 flux_p_reference],0.1,0);
    liste_taub(i,1)=taub;
end

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
        
        
    
    
    
    
