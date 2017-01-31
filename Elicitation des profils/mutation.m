function enfant=mutation(enfant,proba_mutation,mini,maxi)

%va être appelé après la création de chaque enfant

%SEULS LES ENFANTS MUTENT

[lignes,colonnes]=size(enfant);


random_1=rand(1,1);
if random_1<proba_mutation
    random_2=round(1+(lignes-1)*rand(1,1)); %numero de ligne qui mute
    enfant(random_2,:)=mini+(maxi-mini).*rand(1,colonnes);   %change la ligne par des valeurs aleatoires
end
    
    
    
    
    

