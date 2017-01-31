function [liste_comparaison_moyenne]=comparaison_premier_du_classement(NBRE_PROFILS_PLUS_1)

script_ranking
ranking_p2=ranking_eq;  %ranking technique Anh Vu

liste_comparaison_moyenne=zeros(1,NBRE_PROFILS_PLUS_1-1); 
%contient des 1 et des 0: 1 si meme premier de classement, 0 sinon.
%nbre_premiers_identiques=0;

X=1; %artifice pour argument factice de tri_vers_ranking

for i=1:NBRE_PROFILS_PLUS_1-1       %itération nbre profils
    liste_temp=zeros(1,100);
    for ii=1:100%itération génération profils aléatoires
        [flux_non_trie,~,ranking]=tri_vers_ranking(i+1,1,X,X);
        ranking_p_reference=tri_Anh_Vu(flux_non_trie,ranking);
        
        for j=1:length(ranking_p2{1})   %itération dans la sous-liste du tri d'Anh Vu
            temp=true;
            if ismember(ranking_p2{1}(j),ranking_p_reference{1})==0
                temp=false;
                break
            end
        end
        if temp==true
            liste_temp(1,ii)=liste_temp(1,ii)+1;
        else
            liste_temp(1,ii)=liste_temp(1,ii)+0;
        end
        liste_comparaison_moyenne(1,i)=mean(liste_temp);
    end
end



% script_ranking
% ranking_p2=ranking;
% 
% liste_comparaison=zeros(1,NBRE_PROFILS_PLUS_1-1); 
% %contient des 1 et des 0: 1 si meme premier de classement, 0 sinon.
% nbre_premiers_identiques=0;
% 
% for i=1:NBRE_PROFILS_PLUS_1-1
%     [flux_non_trie,~,ranking_p_reference]=tri_vers_ranking(NBRE_PROFILS_PLUS_1);
%     if ranking_p2(1,1)==ranking_p_reference(1,1)
%         liste_comparaison(1,i)=1;
%         nbre_premiers_identiques=nbre_premiers_identiques+1;
%     else
%         liste_comparaison(1,i)=0;
%     end
% end



    
    