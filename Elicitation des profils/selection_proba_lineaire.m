function parents_vainqueurs=selection_proba_lineaire(liste_parents_triee,liste_taub)

%L'ORDRE DES PARENTS ET DES TAUB EST LE MEME: LE 1ER TAUB CORRESPOND AU 1ER
%PARENT, LE 2E TAUB AU 2E PARENT, ETC.

%PARENTS_VAINQUEURS EST UNE LISTE DANS LAQUELLE 2 PARENTS CONSECUTIFS SONT
%DESTINES A ETRE CROISES

[lignes,colonnes]=size(liste_taub); %on aurait pu aussi mettre size(liste_parents_triee) ça revient au même
maxi=max(liste_taub);
mini=min(liste_taub);

parents_vainqueurs={};

j=0;
for i=1:lignes
    proba=proba_lineaire(liste_taub(i,1),maxi,mini);
    nbre=rand(1,1);
    if nbre<proba
        j=j+1;
        parents_vainqueurs{j,1}=liste_parents_triee{i,1};
    end
end
    