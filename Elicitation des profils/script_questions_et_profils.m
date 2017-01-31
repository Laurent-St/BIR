%script_questions_et_profils
clear;clc;

MAX_CONTRAINTES=20;
MAX_PROFILS=20;
PAS=5;
NBRE_ITERATIONS_AG=35;

matrice_res=zeros(MAX_CONTRAINTES/PAS,MAX_PROFILS/PAS); %va être une matrice contenant les tau-b
%maximals atteints en fonction des contraintes ("axe horizontal") et du nombre de 
%profils("axe vertical"). Attention les valeurs sont espacées de 5
%emplacements dans chaque direction (le reste étant des zéros) car on itère
%par pas de 5.
comparaison_profils_max=zeros(MAX_CONTRAINTES/PAS,MAX_PROFILS/PAS); %va être une matrice contenant la plus grande norme de différence
%entre 2 profils par cas (càd par combinaisons de i contraintes pour i
%profils
comparaison_profils_moyenne=zeros(MAX_CONTRAINTES/PAS,MAX_PROFILS/PAS); %meme chose mais avec la valeur moyenne

k=0;    %juste pour l'emplacement dans la matrice des résultats
kk=0;
for i=5:PAS:MAX_CONTRAINTES
    k=k+1;
    kk=0;
    for j=5:PAS:MAX_PROFILS
        kk=kk+1;
        [profils,taub_max,~]=questions_et_profils(i,j,NBRE_ITERATIONS_AG);
        matrice_res(k,kk)=taub_max;
        
        temp=[];
        counter=0;
        for x=1:(length(profils)-1)
            for y=x:length(profils)
                counter=counter+1;
                temp(counter)=comparaison_profils(profils{x,1},profils{y,1});
            end
        end
        comparaison_profils_max(k,kk)=max(temp);
        comparaison_profils_moyenne(k,kk)=mean(temp);
    end
end
        