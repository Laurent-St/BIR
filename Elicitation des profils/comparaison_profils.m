function norme_diff=comparaison_profils(prof1,prof2)

% Renvoie la norme de la différence de 2 profils (et pas la diff des
% normes), mise en % par rapport à la norme du plus grand profil
% Attention il faut que les 2 profils soient de meme taille

norm1=norm(prof1);
norm2=norm(prof2);

if norm1>=norm2
    norme_diff=norm(prof1-prof2)*100/norm1;
else
    norme_diff=norm(prof2-prof1)*100/norm2;
end