% script_norme_ecart

[liste_norme_diff,liste_individus_taub_1]=norme_ecart();

ecart_max=max(liste_norme_diff);

disp('Ecart maximum, en % de la norme du jeu de donnees:');disp(ecart_max);
