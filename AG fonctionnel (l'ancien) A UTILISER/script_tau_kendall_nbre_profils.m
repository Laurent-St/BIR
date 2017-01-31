%script_tau_kendall_nbre_profils

NBRE_PROFILS_PLUS_1=11;

liste_tau=tau_kendall_nbre_profils(NBRE_PROFILS_PLUS_1);

x=1:1:NBRE_PROFILS_PLUS_1-1;

title('Tau-b de Kendall profils aleatoires, CPU Ranking 40 alternatives 6 critères'); hold on;
xlabel('Nombre de profils');hold on;
ylabel('Tau-b de Kendall');hold on;
plot(x,liste_tau);
