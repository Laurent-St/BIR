%script_pouvoir_discriminant
NBRE_PROFILS_PLUS_1=11;

[liste_n_moyen,liste_n_min,liste_n_max,liste_nbre_profils]=pouvoir_discriminant(NBRE_PROFILS_PLUS_1);

% image(1)
title('Pouvoir discriminant, profils aleatoires'); hold on;
xlabel('Nombre de profils');hold on;
ylabel('Nombre de cat�gories');hold on;
plot(liste_nbre_profils,liste_n_moyen,'b');
hold on;
plot(liste_nbre_profils,liste_n_min,'r');
hold on;
plot(liste_nbre_profils,liste_n_max,'g');
hold off;
