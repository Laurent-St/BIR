function liste_enfants=croisement(donnees,parents_vainqueurs,PROBA_MUTATION)
%LISTE PARENTS DOIT ETRE TRIEE!

%L'ORDRE DES PARENTS ET DES TAUB EST LE MEME: LE 1ER TAUB CORRESPOND AU 1ER
%PARENT, LES 2E TAUB AU 2E PARENT, ETC.


%EFFECTUE AUSSI DIRECT LA MUTATION

%APPLICATION DE LA ROULETTE PROBABILISTE
% [lignes_donnees,colonnes_donnees]=size(donnees);
% [lignes,~]=size(liste_taub_selection);

mini=recherche_minimum(donnees);    %utilise comme parametre pour la mutation
maxi=max(max(donnees));             %utilise comme parametre pour la mutation



j=0;    %compteur pour l'ajout à la liste (fin du code)



[nbre_vainqueurs,~]=size(parents_vainqueurs);

liste_enfants={};

i=1;
while i<(nbre_vainqueurs-1)     %A LA FIN: METTRE i=i+1 SI ON FAIT PAR TOURNOI, i=i+2 SI ON FAIT PAR NORME
    ii=i+1;
    %disp('numero croisement=');disp(i);
    parent_1=parents_vainqueurs{i,1};
    parent_2=parents_vainqueurs{ii,1};
    
    %%%%COMMENTER LA PARTIE SUIVANTE SI ON A FAIT SELECTION PAR NORME%%%%%%
    
    norme_1=norm(parent_1); %calcule la NORME-2 DE LA MATRICE
    norme_2=norm(parent_2);
    
    EPSILON=0.025; %pour ne pas que des normes trop proches soit acceptées.
    
    while (abs(norme_1-norme_2)<EPSILON)&&(ii<nbre_vainqueurs)
        disp('parents semblables');
        ii=ii+1;
        parent_2=parents_vainqueurs{(ii),1};
        norme_2=norm(parent_2);
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if abs(norme_1-norme_2)>EPSILON
        
        j=j+1;

        [lignes_parents,colonnes_parents]=size(parent_1);
        enfant_1=zeros(lignes_parents,colonnes_parents);
        enfant_2=zeros(lignes_parents,colonnes_parents);
        for p=1:lignes_parents
            %disp('p=');disp(p);
            profil_temp_1=parent_1(p,:);
            profil_temp_2=parent_2(p,:);
            [~,longueur_profil]=size(profil_temp_1);
            vecteur_poids_random=rand(1,longueur_profil);
            nouveau_profil=vecteur_poids_random.*profil_temp_1+(1-vecteur_poids_random).*profil_temp_2;
            enfant_1(p,:)=nouveau_profil;
            nouveau_profil=(1-vecteur_poids_random).*profil_temp_1+vecteur_poids_random.*profil_temp_2;
            enfant_2(p,:)=nouveau_profil;
        end
        %TRI DES PROFILS PAR COLONNE AU SEIN DE CHAQUE ENFANT
        for pp=1:colonnes_parents
            enfant_1(:,pp)=sort(enfant_1(:,pp),'descend');
            enfant_2(:,pp)=sort(enfant_2(:,pp),'descend');
        end

        enfant_1=mutation(enfant_1,PROBA_MUTATION,mini,maxi);    %MUTATION
        enfant_2=mutation(enfant_2,PROBA_MUTATION,mini,maxi);

        liste_enfants{j,1}=enfant_1;
        j=j+1;
        liste_enfants{j,1}=enfant_2;

    %     liste_parents_plus_enfants{lignes+j,1}=enfant_1;    %on ajoute l'enfant_1 à la liste
    %     j=j+1;
    %     liste_parents_plus_enfants{lignes+j,1}=enfant_2;    %on ajoute l'enfant_2 à la liste
    end
    
    i=i+1;  %METTRE i=i+1 SI ON FAIT PAR TOURNOI, i=i+2 SI ON FAIT PAR NORME
    
end



% %SELECTION D'UN INDIVIDU SUR DEUX POUR REDUIRE
% 
% [ligne_intermediaire,~]=size(liste_parents_plus_enfants);
% 
% if ligne_intermediaire>100
%     liste_parents_plus_enfants_finale={};
%     x=1;
%     while ((2*x)-1)<ligne_intermediaire
%         liste_parents_plus_enfants_finale{x,1}=liste_parents_plus_enfants{(2*x)-1,1};
%         x=x+1;
%     end
% else
%     liste_parents_plus_enfants_finale=liste_parents_plus_enfants;
% end


    
    
    