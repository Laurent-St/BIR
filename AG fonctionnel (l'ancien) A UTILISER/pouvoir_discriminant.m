function [liste_n_moyen liste_n_min liste_n_max liste_nbre_profils]=pouvoir_discriminant(NBRE_PROFILS_PLUS_1)

X=1; %artifice pour argument factice de tri_vers_ranking

liste_n_moyen=zeros(1,NBRE_PROFILS_PLUS_1-1);
liste_n_min=zeros(1,NBRE_PROFILS_PLUS_1-1);
liste_n_max=zeros(1,NBRE_PROFILS_PLUS_1-1);

liste_nbre_profils=zeros(1,NBRE_PROFILS_PLUS_1-1);

for i=1:NBRE_PROFILS_PLUS_1-1
    liste_temp=zeros(1,100);
    for j=1:100
%         [~,temp,~]=tri_vers_ranking(NBRE_PROFILS_PLUS_1);
%         n=length(unique(temp));
%         liste_temp(1,j)=n;
        [flux_non_trie,~,ranking]=tri_vers_ranking(i+1,1,X,X);
        flux_trie_Anh_Vu=tri_Anh_Vu(flux_non_trie,ranking);
        n=length(flux_trie_Anh_Vu);
        liste_temp(1,j)=n;
    end
    liste_n_moyen(1,i)=mean(liste_temp);
    liste_n_min(1,i)=min(liste_temp);
    liste_n_max(1,i)=max(liste_temp);
    liste_nbre_profils(1,i)=i;
end
    
        