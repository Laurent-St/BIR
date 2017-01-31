function [profils, taub_max, taub_moyen]=questions_et_profils(nbre_questions, nbre_profils_par_individu,nbre_iterations_AG)
% profils est une cellule de listes (chaque liste étant un parent, un
% ensemble de profils de référence), contenant tous les parents de la
% dernière generation de l'AG
% profils va être le meilleur ensemble de profils de référence respectant
% la contrainte de la question

%taub_max est le tau_b maximum atteint lors de la dernière génération de
%l'AG

%taub_moyen est le tau_b moyen atteint lors de la dernière génération de
%l'AG


%%%%%%CALCUL DU CLASSEMENT PII%%%%%%
script_ranking; %fait appel à datafile pour les données
flux_p2=flux;
ranking_p2=ranking;

%%%%%%QUESTIONS A LA BOITE NOIRE%%%%%%
contraintes=zeros(nbre_questions,2);    %chaque ligne a 2 entrées: la première est l'indice de l'alternative préférée,
%et la 2e est l'indice de l'alternative non préférée.

[~,col]=size(ranking_p2);
for i=1:nbre_questions
    indice_alt_a=ceil(1+(col-1)*rand(1,1)); %lines vient de script_ranking, c'est le nbre d'alternatives
    indice_alt_b=ceil(1+(col-1)*rand(1,1));
    
    %indice_alt_x donne l'indice d'une alternative dans le jeu de données
    %initial.
    
    %comme ranking_p2 est une liste contenant les indices du classement, il
    %faut trouver si l'alternative a est classée devant l'alternative b:
    
    %recherche de la position de alt_1 et 2 dans le classement p2.
    le=length(ranking_p2);
    res=false;
    k=1;
    while (k<=le)&(res==false)
        res=(ranking_p2(k)==indice_alt_a);
        k=k+1;
    end
    
    res=false;
    kk=1;
    while (kk<=le)&(res==false)
        res=(ranking_p2(kk)==indice_alt_b);
        kk=kk+1;
    end
    
    %k et kk donnent la position des alternatives a et b dans le
    %classement p2
    
    if kk<k %alors kk est plus proche de la première place donc alt_b est préféré à alt_a
        contraintes(i,1)=indice_alt_b;
        contraintes(i,2)=indice_alt_a;
        disp('Contrainte enregistree');
    else
        contraintes(i,1)=indice_alt_a;
        contraintes(i,2)=indice_alt_b;
         
    end
end
    
disp('Contraintes générées');
%CODER L'INTERPRETATION DE LA CONTRAINTE!!!
    
[liste_taub_max,~,liste_taub_moyen,~,liste_individus_complete,~]=test_algo_genetique(nbre_profils_par_individu,nbre_iterations_AG,contraintes);

profils_cell=liste_individus_complete(end);
profils=profils_cell{1,1};
taub_max=liste_taub_max(end);
taub_moyen=liste_taub_moyen(end);




