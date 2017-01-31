%script affichage test EPI 30, 60, 100 alternatives

taub_max=[0.963903760462132 0.956512574275032 0.945134104288003];
taub_moyen=[0.954280802057245 0.945861690728922 0.932404711854508];

abscisse=[1 2 3];

title('Tau-b de Kendall apres AG, Shangai 3 criteres, 30, 60 puis 100 alternatives'); hold on;
xlabel('1: 30 alternatives, 2: 60 alternatives, 3:100 alternatives');hold on;
ylabel('Tau-b de Kendall');hold on;
plot(abscisse,taub_max,'*'); hold on;
plot(abscisse,taub_moyen,'*'); hold on;
legend('Bleu: maximum', 'Rouge: moyen');
