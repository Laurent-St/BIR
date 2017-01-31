function liste_parents=choix_profils_pour_algo_genetique(donnees,nombre_profils_du_parent)

%chaque parent a le meme nombre de profils!

%chaque profil au sein d'un parent est une LIGNE et pas une colonne

NBRE_PARENTS_INITIAL=500;


mini=recherche_vecteur_minimum(donnees);    %VECTEUR ligne
maxi=max(donnees); %VECTEUR ligne
[n,q]=size(donnees);
liste_parents=cell(NBRE_PARENTS_INITIAL,1);  %va être une cellule verticale de listes

% for i=1:(n/2)
%     numero_ligne_random=ceil(mini+(maxi-mini)*rand(1,1));
%     liste_parents(1,i)=donnees(numero_ligne_random,:);
% end

for i=1:NBRE_PARENTS_INITIAL
     parent=zeros(nombre_profils_du_parent,q);     %va être une matrice ligne
    
    for j=1:nombre_profils_du_parent
         parent(j,:)=mini+(maxi-mini).*rand(1,q);
        
        
%         numero_ligne_random=round(1+(n-1)*rand(1,1));
%         temp=donnees(numero_ligne_random,:);
%         for jj=1:length(donnees(numero_ligne_random,:))
%             
%             parent(j,jj)=temp(1,jj);
%         end

    end
    
    %TRI DES PROFILS PAR COLONNE
%     for jj=1:q
%         parent(:,jj)=sort(parent(:,jj),'descend');
%     end
    parent=sort(parent,'descend'); %trie toutes les COLONNES PAR ORDRE DECROISSANT
        
    liste_parents{i,1}=parent;
end

%AJOUT DES COPIES DES ALTERNATIVES DE BASE SI MEME NOMBRE DE PROFIL PAR
%PARENT QUE D'ALTERNATIVES

if nombre_profils_du_parent==n
    parent_degenere=donnees;
    for k=1:q
        parent_degenere(:,k)=sort(parent_degenere(:,k),'descend');
    end
    liste_parents{(NBRE_PARENTS_INITIAL+1),1}=parent_degenere;
end



        
    
