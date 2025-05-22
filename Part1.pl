%1.1 search

search(X, cons(X, _)).
search(X, cons(_, T)):- search(X, T).

%1.2 search2 (two consecutive elements)
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, T)):- search2(X, T).

%search2(a, cons(c,cons(a,cons(a,cons(d,cons(a,cons(a,nil))))))) aa presente due volte
%search2(a, cons(c,cons(a,cons(a,cons(a,nil))))). aa presente due volte, c'è overlap delle sequenze
%search2(a, L). genera una lista con aa consecutivi, loop infinito
%search2(a, cons(_,cons(a,cons(_,cons(a,cons(_,nil)))))). possibili sostituzioni per tornare yes nei tre blank


%1.3 search_two (due elementi uguali non consecutivi)
search_two(X, cons(X, cons(_, cons(X , _)))).
search_two(X, cons(H,T)):- search_two(X, T).

%1.4 search_anytwo (due elementi uguali nella lista in qualsiasi posizione)
search_anytwo(X, cons(X,T)):- search(X, T).
search_anytwo(X, cons(H,T)):- search_anytwo(X, T).
