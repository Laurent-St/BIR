function parents_vainqueurs=selection_norme(liste_parents_triee)
%SELECTION DE PAIRES DE PARENTS A ACCOUPLER SUR BASE DE LA DIFFERENCE DE
%NORME

%ATTENTION PAS AU POINT


delta_max=abs(norm(liste_parents_triee{1})-norm(liste_parents_triee{end}));

delta_min=0.05;

parents_vainqueurs={};

parents_temp={};    %liste organisee par PAIRES!

delta_temp=[]; %liste des deltas de chaque paire ENTRECOUPES CHAQUE FOIS PAR UN ZERO

ii=1;

for i=1:length(liste_parents_triee)-1
    liste_delta=zeros(length(liste_parents_triee)-i,1);
    for j=(i+1):length(liste_parents_triee)
        liste_delta((j-1),1)=abs(norm(liste_parents_triee{i})-norm(liste_parents_triee{j}));
    end
%     [liste_delta,indices]=sort(liste_delta,'descend');
    
    parents_temp(ii)=liste_parents_triee(i);
    delta_temp(ii)=liste_delta(1);
    ii=ii+1;
    delta_temp(ii)=0;
    parents_temp(ii)=liste_parents_triee(i+indices(1));
    ii=ii+1;
end

maxi=max(delta_temp);
mini=min(delta_temp);

kk=1;

while k<length(parents_temp)
    proba=proba_lineaire(delta_temp(k),maxi,mini);
    nbre_random=rand(1,1);
    if nbre_random<proba
        parents_vainqueurs(kk)=parents_temp(kk);
        kk=kk+1;
        parents_vainqueurs(kk)=parents_temp(kk);
    end
    k=k+2;
end
    
    



    
    
    
    
    
        
        