%script_ranking


datafile;
[lines,columns]=size(evaluations);
%flux_list=zeros(1,lines); %crée un LIGNE de zéros
flux_list=zeros(lines,1); %crée une colonne de zéros
for i=1:lines
    flux_list(i,1)=flux_net(i,evaluations,evaluations,q,p,s,choosed_preference_function,weights);
end
flux_non_trie=flux_list;
[flux,ranking]=sort(flux_list,'descend');

ranking_eq = tri_Anh_Vu(flux_non_trie,ranking);
%ranking_names=alternatives{ranking}

 ranking=reshape(ranking,[1 length(ranking)]);
 
% for value=ranking
%     disp(alternatives{value}) %pour afficher les noms des alternatives
% end

flux_transfo_lineaire=(flux+1)*50;

%bar(flux_transfo_lineaire);

    
    
