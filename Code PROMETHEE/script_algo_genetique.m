%script_algo_genetique
liste_taub_max_par_nbre_profils=zeros(30,1);
liste_taub_moyen_par_nbre_profils=zeros(30,1);

for n=5:30
    disp('n=');disp(n);
    [liste_taub_max,~,liste_taub_moyen,~,~,iteration]=test_algo_genetique(n);
    liste_taub_max_par_nbre_profils(n,1)=liste_taub_max(iteration);
    liste_taub_moyen_par_nbre_profils(n,1)=liste_taub_moyen(iteration);
end

n=1:1:30;
figure(1);hold on;
title('Tau-b maxi et moyen, fonction du nombre profils par individu, 20 alternatives'); hold on;
xlabel('Nombre profils par individu');hold on;
ylabel('Tau-b de Kendall');hold on;
plot(n,liste_taub_max_par_nbre_profils,'g');hold on;
plot(n,liste_taub_moyen_par_nbre_profils,'b');hold on;
% legend('tau-b maximum','tau-b moyen');hold on;



    


% liste_taub_max_par_nbre_profils=zeros(1,29);
% for n=12:12  %(longueur de evaluations moins un)
%     disp('n=');disp(n);
%     [liste_taub_max,~,~,~]=test_algo_genetique(n);
%     liste_taub_max_par_nbre_profils(1,n)=taub_max;
% %     if taub_max==1
% %         break
% %     end
% end
% 
% nbre_profils_min=n;
    

