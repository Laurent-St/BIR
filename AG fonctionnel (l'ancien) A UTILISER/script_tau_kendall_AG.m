%script_tau_kendall_AG

%POUR CHAQUE JEU DE DONNEES: prendre les mesures pour un certain nombre
%d'alternatives, les enregistrer, augmenter le nbre d'alternatives et
%relancer, enregistrer, augmenter nbre alternatives, puis tracer le graphe.

%LES CHANGEMENTS DE JEUX DE DONNEES DOIVENT ETRE FAITS DANS
%test_algo_genetique ET DANS datafile.

NBRE_PROFILS_PAR_PARENT=10;
NBRE_GEN=10;

[liste_taub_max,~,liste_taub_moyen,~,~,iteration]=test_algo_genetique(NBRE_PROFILS_PAR_PARENT,NBRE_GEN);

taub_max_atteint=liste_taub_max(iteration);
taub_moyen_atteint=liste_taub_moyen(iteration);