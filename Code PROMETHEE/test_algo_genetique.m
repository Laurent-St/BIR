%script_test_algo_genetique
function [liste_taub_max,liste_individus_taub_max,liste_taub_moyen,liste_taub_complete,liste_individus_complete,iteration]=test_algo_genetique(nbre_profils_par_individu);

%DONNEES

evaluations=[99.35	93.77	98.57	93.52	85.89	17.37	72.87	96.93	90.2;
99.68	97.04	99.29	88.2	88.89	0	57.27	66.04	96.4;
99.03	93.26	99.57	96.08	100	16.32	50.82	88.76	92.73;
96.19	86.98	99.71	95.72	96.63	28.08	23.06	97.6	88.67;
88.86	78.26	97.83	87.8	92.05	84.71	0	100	82.2;
92.5	91.27	99.93	97.52	78.2	41.5	45.05	96.73	81.83;
96.5	93.36	99.79	85.4	100	0	54.03	95.78	90.82;
97.44	92.9	95.44	90.9	100	22.2	56.47	100	76.58;
83.68	94.81	100	89.37	49.75	0	82.36	93.98	84.79;
88.25	82.43	99.22	92.41	98.79	55.05	60.75	99.52	80.12;
97.76	95.67	100	90.52	65.32	35.27	27.89	92.75	83.69;
95.26	86.78	99.5	98.94	61.28	30.36	22.91	98.98	84.53;
100	96.13	100	97.88	83.9	33.92	39.6	87.18	62.81;
80.26	87.8	100	100	0	0	64.21	72.26	95.44;
87.65	75.59	95.87	83.75	92.05	81.31	65.35	98.96	85.23;
79.31	72.09	99.93	98.23	94.06	83.96	0	90.43	82.53;
100	94.59	98.86	93.89	63.01	66.85	93.89	82.2	57.12;
87.04	72.19	100	97.16	99.7	53.63	0	93.33	78.76;
98.39	94.39	94.02	84.99	75.76	20.34	26.5	90.51	91.19;
85.52	82.54	98.57	99.3	54.6	0	0	100	74.05;
80.89	87.01	99.36	92.03	100	62.66	42.96	94.82	69.64;
93.11	88.77	91.11	96.44	83.08	6.46	42.11	97.81	83.19;
90.07	86.47	90.85	82.91	99.1	24.83	53.33	98.55	85.72;
82.44	70.74	98.12	86.21	91.37	45.46	0	100	90.78;
94.64	91.16	99.65	89.75	95.68	39.1	35.51	74.5	74.59;
94.34	89.73	99.17	84.16	99.4	18.39	43.1	79.35	80.88;
81.51	61.99	98.93	88.98	98.18	44.36	0	100	91.23;
82.75	67.3	95.62	84.58	100	42.09	0	100	91.08;
76.09	72.75	99.64	92.78	88.16	80.93	29.19	98.96	79.35;
84.6	69.88	99.5	98.59	68.35	61.36	34.04	100	78.19];

%RECHERCHE DES VECTEURS MINIMUM ET MAXIMUM
mini=recherche_vecteur_minimum(evaluations);    %VECTEUR ligne
maxi=max(evaluations); %VECTEUR ligne

%PREMIERE GENERATION: ALEATOIRE
tic;
liste_parents=choix_profils_pour_algo_genetique(evaluations,nbre_profils_par_individu);
toc;

[~,criteres]=size(evaluations);

[taille_initiale,~]=size(liste_parents);

n=round(taille_initiale/5);
%EVALUATION
tic;
[liste_taub_triee,indices_tri_taub,~,~]=evaluation(liste_parents);
toc;

%ElAGUAGE DES 1000 PARENTS: ON EN GARDE n
liste_parents_elaguage={};
liste_taub_elaguage=liste_taub_triee(1:n,:);
% liste_parents_elaguage=liste_parents(indices_tri_taub(1:n));

for j=1:n
    liste_parents_elaguage{j,1}=liste_parents{indices_tri_taub(j,1),1};
end

% [taille_elaguage,~]=size(liste_parents_elaguage);

% %PRISE DE 50 PARENTS POUR LA SELECTION
% liste_parents_selection=liste_parents_elaguage(1:50,:);
% liste_taub_selection=liste_taub_elaguage(1:50,:);

%%%%%%%%%%%%%%%%%%%%%%%
%SHUFFLER AVEC TOURNOI SUR LES 200
%%%%%%%%%%%%%%%%%%%%%%%

%SELECTION
% SELECTION PAR TOURNOI

perm1=randperm(length(liste_parents_elaguage));
liste_parents_melange=liste_parents_elaguage(perm1);   %equivalent a SHUFFLE
liste_taub_melange=liste_taub_elaguage(perm1);
parents_vainqueurs=tournament_selection(liste_parents_melange,liste_taub_melange,(n/4));

% SELECTION AVEC FONCTION DE PROBA LINEAIRE
% parents_vainqueurs=selection_proba_lineaire(liste_parents_elaguage,liste_taub_elaguage);

%SELECTION PAR NORME
% parents_vainqueurs=selection_norme(liste_parents_elaguage);

%CROISEMENT ET MUTATION
PROBA_MUTATION=0.3;
liste_enfants=croisement(evaluations,parents_vainqueurs,PROBA_MUTATION);

[liste_taub_triee_enfants,indices_tri_enfants,~,~]=evaluation(liste_enfants);

liste_enfants_triee=cell(length(liste_enfants),1);
for k=1:length(liste_enfants)
    liste_enfants_triee{k,1}=liste_enfants{indices_tri_enfants(k,1),1};
end
% [nbre_enfants,~]=size(liste_enfants);

%AJOUT DES ENFANTS A LA POPULATION
[liste_taub_elaguage,liste_parents_elaguage]=ajout_et_tri_taub(liste_taub_elaguage,liste_taub_triee_enfants,liste_parents_elaguage,liste_enfants_triee);
% liste_parents_elaguage{taille_elaguage:(taille_elaguage+nbre_enfants),:}=liste_enfants;
% 
% liste_taub_elaguage{taille_elaguage:(taille_elaguage+nbre_enfants),:}=liste_taub_triee_enfants;
% 
% liste_parents_elaguage=sort(liste_parents_elaguage,'descend');  %ATTENTION ON NE PEUT PAS FAIRE JUSTE SORT
% %IL FAUT DONNER LES TAUB
% 
% liste_taub_elaguage=sort(liste_taub_elaguage,'descend');

%PRISE DES 200 PREMIERS PUIS DE NOUVEAU SHUFFLE ETC.: A FAIRE DANS LA
%BOUCLE

NBRE_GENERATIONS=500;

liste_taub_max=zeros(NBRE_GENERATIONS,1);
liste_individus_taub_max=cell(NBRE_GENERATIONS,1);
liste_taub_moyen=zeros(NBRE_GENERATIONS,1);
liste_individus_taub_2e=cell(NBRE_GENERATIONS,1);

liste_taub_complete=cell(NBRE_GENERATIONS,1);   %VA ETRE UNE CELLULE DE LISTES
%QUI CONTIENDRA TOUTES LES VALEURS DE TAUB DE TOUTES LES GENERATIONS
liste_individus_complete=cell(NBRE_GENERATIONS,1); %VA ETRE UNE CELLULE DE CELLULES DE LISTES
%QUI CONTIENDRA TOUS LES INDIVUS DE TOUTES LES GENERATIONS

compteur=1; %compteur pour la condition d'ajout d'aleatoire
tic;
for i=1:NBRE_GENERATIONS
    disp('i=');disp(i);
    
        
    compteur=compteur-1;
    
    if (i>11)&&(liste_taub_moyen(i-11)==liste_taub_moyen(i-1))&&(compteur<0)
        compteur=20;
        
        disp('Stagnation: proba de mutation augmentee');
        PROBA_MUTATION=1;
%         liste_parents_elaguage=liste_parents_elaguage(1:(round(n/2)),:);  %on prend 1/2 de n dans la liste des parents
%         liste_taub_elaguage=liste_taub_elaguage(1:(round(n/2)),:);

        %AJOUT D'ALEATOIRE: on garde le premier et on ne met que de
        %l'aleatoire après
        liste_parents_alea=cell((n-1),1);
        for ii=1:(n-1)
            parent_temp=zeros(nbre_profils_par_individu,criteres);
            for iii=1:nbre_profils_par_individu
                parent_temp(iii,:)=mini+(maxi-mini).*rand(1,criteres);
            end
            parent_temp=sort(parent_temp,'descend');
            liste_parents_alea{ii,1}=parent_temp;
        end
        [taub_ajout_alea,indices_ajout_alea]=evaluation(liste_parents_alea);
        liste_parents_alea_triee=cell(length(liste_parents_alea),1);
        for qq=1:length(liste_parents_alea)
            liste_parents_alea_triee{qq,1}=liste_parents_alea{indices_ajout_alea(qq,1),1};
        end
        liste_parents_elaguage=[liste_parents_elaguage(1);liste_parents_alea_triee];
        liste_taub_elaguage=[liste_taub_elaguage(1);taub_ajout_alea];
%         [liste_taub_elaguage,liste_parents_elaguage]=ajout_et_tri_taub(liste_taub_elaguage,taub_ajout_alea,liste_parents_elaguage,liste_parents_alea_triee);
    else
        PROBA_MUTATION=0.3;
        liste_parents_elaguage=liste_parents_elaguage(1:n,:);
        liste_taub_elaguage=liste_taub_elaguage(1:n,:);
    end

    
    %MELANGE ET SELECTION (PAR TOURNOI ICI)
    perm1=randperm(length(liste_parents_elaguage));
    liste_parents_melange=liste_parents_elaguage(perm1);   %equivalent a SHUFFLE
    liste_taub_melange=liste_taub_elaguage(perm1);
    parents_vainqueurs=tournament_selection(liste_parents_melange,liste_taub_melange,(n/4));
%     parents_vainqueurs=selection_norme(liste_parents_elaguage);
    
    %CROISEMENT
    liste_enfants=croisement(evaluations,parents_vainqueurs,PROBA_MUTATION);
    
    while length(liste_enfants)<round((length(parents_vainqueurs))/8)
        parents_vainqueurs=tournament_selection(liste_parents_melange,liste_taub_melange,(n/5));
        liste_enfants=croisement(evaluations,parents_vainqueurs,PROBA_MUTATION);
    end    
    
    %TRI DES ENFANTS ET AJOUT AUX LISTES D'ELAGUAGE
    [liste_taub_triee_enfants,indices_tri_enfants,~,~]=evaluation(liste_enfants);
    liste_enfants_triee=cell(length(liste_enfants),1);
    for kk=1:length(liste_enfants)
        liste_enfants_triee{kk,1}=liste_enfants{indices_tri_enfants(kk,1),1};
    end
    
    [liste_taub_elaguage,liste_parents_elaguage]=ajout_et_tri_taub(liste_taub_elaguage,liste_taub_triee_enfants,liste_parents_elaguage,liste_enfants_triee);
    
    %EXTRACTION DU TAUB MAX, MOYEN, ET DES INDIVIDUS CORRESPONDANTS, ETC.
    liste_taub_max(i,1)=liste_taub_elaguage(1);
    liste_individus_taub_max{i}=liste_parents_elaguage{1};
    
    
    temp=liste_taub_elaguage(2:100);
    taub_moyen=mean(temp);
    disp('taub moyen=');disp(taub_moyen);
    liste_taub_moyen(i)=taub_moyen;
    
    liste_individus_taub_2e{i,1}=liste_parents_elaguage{2,1};
    
    liste_taub_complete{i,1}=liste_taub_elaguage;
    liste_individus_complete{i,1}=liste_parents_elaguage;
    
    if taub_moyen==1
        break
    end
    
end
toc;

iteration=i;
%LA LISTE DES TAUB PAR GENERATION EST LISTE_TAUB_ELAGAGE ET LES INDIVIDUS
%CORRESPONDANTS SONT DANS LISTE_PARENTS_ELAGUAGE




%MODIFIER LA SUITE!!!!!!!!!!!!



% %NOUVELLES EVALUATIONS + CRITERE D'ARRET + NOUVEAUX CROISEMENTS
% 
% liste_taub_max=zeros(100,1);  %si on injecte les evaluations de base comme profil, le taub_max sera tjrs de 1
% liste_individus_taub_max=cell(100,1);
% 
% liste_taub_moyen=zeros(100,1);  
% %liste_individus_taub_2e=cell(100,1);
% for i=1:100
%     disp('i=');disp(i);
%     [liste_taub_triee,indices_tri_taub,individu_taub_max,taub_max]=evaluation(liste_parents_plus_enfants);
%     liste_taub_max(i,1)=taub_max;
%     liste_individus_taub_max{i,1}=individu_taub_max;
%     
%     temp=liste_taub_triee(2:10,1);
%     liste_taub_moyen(i,1)=mean(temp);
%     disp('taub moyen=');disp(mean(temp));
%     %liste_individus_taub_2e{i,1}=liste_parents_plus_enfants{indices_tri_taub(2,1),1};
%     
%     %disp('taub 2e');disp(liste_taub_triee(2,1))
%     
% %     if taub_max==1
% %         [nbre_profil_taub_max,~]=size(individu_taub_max);
% %         disp('TAU-B DE 1 TROUVE')
% %         break
% %     end
%     [liste_parents,liste_enfants]=croisement(liste_parents_plus_enfants,liste_taub_triee,evaluations);
% end
% 
% % taub_max_final=max(liste_taub_max);
% % taub_2e=max(liste_taub_2e);
        


