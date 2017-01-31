function proba=proba_lineaire(taub,taub_max,taub_min)

proba_max=0.8;
proba_min=0.2;

proba=proba_min+((proba_max-proba_min)/(taub_max-taub_min))*(taub-taub_min);