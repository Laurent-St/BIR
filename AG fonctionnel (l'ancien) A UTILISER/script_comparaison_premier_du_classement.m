%script_comparaison_premier_du_classement
NBRE_PROFILS_PLUS_1=11;

liste_comparaison_moyenne=comparaison_premier_du_classement(NBRE_PROFILS_PLUS_1);

x=1:NBRE_PROFILS_PLUS_1-1;

image(1)
plot(x,liste_comparaison_moyenne)

% image(2)
% plot(x,nbre_premiers_du_classement)
% 
% NBRE_PROFILS_PLUS_1=11;

