%script_kendall
function kendall_taub=kendall_p2_p_reference(NBRE_PROFILS_PLUS_1)

%calcule le tau-b de Kendall pour mesurer la corrélation entre notre ranking
%et celui de PROMETHEE II

script_ranking;
%ranking=reshape(ranking,[length(ranking) 1]);
flux_p2=flux_non_trie;
%ranking_p2=ranking;

%script_tri_vers_ranking
X=1; %artifice pour argument factice de tri_vers_ranking
[flux_p_reference,~,~]=tri_vers_ranking(NBRE_PROFILS_PLUS_1,1,X,X);
%ranking_p_reference=ranking;

% tau_kendall=corr(flux_p2,flux_p_reference,'type','kendall')

[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([flux_p2 flux_p_reference],0.1,0);

kendall_taub=taub;
