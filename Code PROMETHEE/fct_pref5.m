function pref5=fct_pref5(q,p,d)  %fonction de préférence 5 p.54 du livre
    if d<=q
        pref5=0;
    elseif (d>q)&&(d<=p)
        pref5=(d-q)/(p-q);
    else
        pref5=1;
    end
end
        