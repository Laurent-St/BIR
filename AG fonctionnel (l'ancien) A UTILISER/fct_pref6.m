function pref6=fct_pref6(s,d)   %fct de pr�f�rence gaussienne
    pref6=1-exp(-(d*d/(2*s*s)));
end