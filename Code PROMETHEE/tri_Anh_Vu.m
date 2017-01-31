function liste_triee_Anh_Vu=tri_Anh_Vu(liste_flux_non_triee,ranking)

%[liste_flux_triee, ranking] = sort(liste_flux_non_triee,'descend');
liste_triee_Anh_Vu={[ranking(1)]};
n=1;
for i=2:length(ranking)
    if liste_flux_non_triee(ranking(i)) ~= liste_flux_non_triee(ranking(i-1))
        n = n + 1;
        liste_triee_Anh_Vu{n} = ranking(i);
    else
        liste_triee_Anh_Vu{end} = [liste_triee_Anh_Vu{end} ranking(i)];
    end
end

        
        
