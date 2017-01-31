function parents_vainqueurs=tournament_selection(liste_parents,liste_taub,tournament_size)

%L'ORDRE DES PARENTS ET DES TAUB EST LE MEME: LE 1ER TAUB CORRESPOND AU 1ER
%PARENT, LE 2E TAUB AU 2E PARENT, ETC.

%parents_vainqueurs est la liste des parents qui vont être croisés
[lignes,colonnes]=size(liste_parents);

NBRE_TOURNOIS=ceil(lignes/8);

parents_vainqueurs=cell(NBRE_TOURNOIS,1);
for i=1:NBRE_TOURNOIS  %on fait lignes/2 tournois
    participants=zeros(tournament_size,1);
    indices=zeros(tournament_size,1);
    for j=1:tournament_size
        temp=floor(1+(lignes-1)*rand(1,1));    %choix aleatoire de participants (floor pour favoriser les premiers)
        participants(j,1)=liste_taub(temp);
        indices(j,1)=temp;
    end
    [~,ranking]=sort(participants,'descend');
    indice_vainqueur=indices(ranking(1,1),1);
    parents_vainqueurs{i,1}=liste_parents{indice_vainqueur,1};
end
    
        
    



