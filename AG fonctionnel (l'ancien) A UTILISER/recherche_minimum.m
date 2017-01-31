function minimum=recherche_minimum(matrice)
%renvoie LE minimum de toute la matrice, et pas une ligne de minimum de
%chaque colonne

[lignes,colonnes]=size(matrice);

ligne_du_min=1;     %valeurs par défaut pour commencer
colonne_du_min=1;   %valeurs par défaut pour commencer

for i=1:lignes
    for j=1:colonnes
        if matrice(i,j)<matrice(ligne_du_min,colonne_du_min)&&(matrice(i,j)~=0)
            ligne_du_min=i;
            colonne_du_min=j;
        end
    end
end

minimum=matrice(ligne_du_min,colonne_du_min);
            
        

