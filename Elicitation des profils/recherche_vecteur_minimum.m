function vecteur_minimum=recherche_vecteur_minimum(matrice)
%renvoie un VECTEUR ligne constitué des minimum respectifs de chaque
%COLONNE de la matrice

[lignes,colonnes]=size(matrice);

ligne_du_min=1;     %valeur par défaut pour commencer

vecteur_minimum=zeros(1,colonnes);

for i=1:colonnes
    for j=1:lignes
        if (matrice(j,i)<matrice(ligne_du_min,i))&&(matrice(j,i)~=0)
            ligne_du_min=j;
        end
    end
    vecteur_minimum(1,i)=matrice(ligne_du_min,i);
end

