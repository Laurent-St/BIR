function [liste_norme_diff,liste_individus_taub_1]=norme_ecart()

%renvoie une liste contenant la NORME DE LA DIFFERENCE entre les individus de
%la dernière génération qui ont un tau-b de 1 et la norme de la matrice de
%données, divisée par la norme de la matrice des données et multipliée par 100 (pour
%avoir des %), dans le cas dégénéré.

%%%%% EVALUATIONS POUR CALCULER LA NORME %%%%%%%
evaluations=[99.35	93.77	98.57	93.52	85.89	17.37	72.87	96.93	90.2;
99.68	97.04	99.29	88.2	88.89	0	57.27	66.04	96.4;
99.03	93.26	99.57	96.08	100	16.32	50.82	88.76	92.73;
96.19	86.98	99.71	95.72	96.63	28.08	23.06	97.6	88.67;
88.86	78.26	97.83	87.8	92.05	84.71	0	100	82.2;
92.5	91.27	99.93	97.52	78.2	41.5	45.05	96.73	81.83;
96.5	93.36	99.79	85.4	100	0	54.03	95.78	90.82;
97.44	92.9	95.44	90.9	100	22.2	56.47	100	76.58;
83.68	94.81	100	89.37	49.75	0	82.36	93.98	84.79;
88.25	82.43	99.22	92.41	98.79	55.05	60.75	99.52	80.12;
97.76	95.67	100	90.52	65.32	35.27	27.89	92.75	83.69;
95.26	86.78	99.5	98.94	61.28	30.36	22.91	98.98	84.53;
100	96.13	100	97.88	83.9	33.92	39.6	87.18	62.81;
80.26	87.8	100	100	0	0	64.21	72.26	95.44;
87.65	75.59	95.87	83.75	92.05	81.31	65.35	98.96	85.23;
79.31	72.09	99.93	98.23	94.06	83.96	0	90.43	82.53;
100	94.59	98.86	93.89	63.01	66.85	93.89	82.2	57.12;
87.04	72.19	100	97.16	99.7	53.63	0	93.33	78.76;
98.39	94.39	94.02	84.99	75.76	20.34	26.5	90.51	91.19;
85.52	82.54	98.57	99.3	54.6	0	0	100	74.05;
80.89	87.01	99.36	92.03	100	62.66	42.96	94.82	69.64;
93.11	88.77	91.11	96.44	83.08	6.46	42.11	97.81	83.19;
90.07	86.47	90.85	82.91	99.1	24.83	53.33	98.55	85.72;
82.44	70.74	98.12	86.21	91.37	45.46	0	100	90.78;
94.64	91.16	99.65	89.75	95.68	39.1	35.51	74.5	74.59;
94.34	89.73	99.17	84.16	99.4	18.39	43.1	79.35	80.88;
81.51	61.99	98.93	88.98	98.18	44.36	0	100	91.23;
82.75	67.3	95.62	84.58	100	42.09	0	100	91.08;
76.09	72.75	99.64	92.78	88.16	80.93	29.19	98.96	79.35;
84.6	69.88	99.5	98.59	68.35	61.36	34.04	100	78.19];

norme_evaluations=norm(evaluations);

NBRE_PROFILS_PAR_INDIVIDU=30; % car ici on considère le cas dégénéré

[~,~,~,liste_taub_complete,liste_individus_complete,iteration]=test_algo_genetique(NBRE_PROFILS_PAR_INDIVIDU,100);

taub_derniere_gen=liste_taub_complete{iteration};
individus_derniere_gen=liste_individus_complete{iteration};

liste_individus_taub_1={};  %cellule de listes
liste_norme_diff=[];  %liste des différences relatives en % (cad divisees par la norme_evaluations)

j=0;
for i=1:length(taub_derniere_gen)
    if taub_derniere_gen(i)==1
        j=j+1;
        temp=individus_derniere_gen{i};
%         norme_temp=norm(temp);
%         liste_diff_norme(j,1)=100*abs(norme_temp-norme_evaluations)/norme_evaluations; %liste de pourcentages
        liste_norme_diff(j,1)=norm(temp-evaluations)*100/norm(evaluations);
        liste_individus_taub_1{j,1}=temp;
    end
end

    