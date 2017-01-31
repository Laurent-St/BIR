%script_kendall_fct_quantile

%Calcule l'ensemble des tau de Kendall pour un nombre de quantiles
%variable.

NBRE_PROFILS_PLUS_1=11;  %à remplacer dans script_tri_vers_ranking et ici

% list_taub=cell(1, NBRE_PROFILS_PLUS_1);
% abscisse=cell(1, NBRE_PROFILS_PLUS_1);

list_taub=[];
abscisse=[];

for i=2:NBRE_PROFILS_PLUS_1
    list_taub(1,i-1)=kendall_p2_p_reference(i);
    abscisse(1,i-1)=i;
end

plot(abscisse,list_taub);




