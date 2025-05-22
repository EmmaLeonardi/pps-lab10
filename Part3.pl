%3.1 same list
same(cons(H, T1), cons(H, T2)):- same(T1, T2). %the lists are the same if the head element is the same and all the tail is the same
same(nil, nil). %two empty lists are the same

%if the first element is > than the second one
greater(s(_), zero).
greater(s(N), s(M)):- greater(N, M).

%3.2 all bigger
%all elements in List1 are bigger than those in List2 ,1 by 1
all_bigger(cons(H1, T1), cons(H2, T2)):- greater(H1, H2), all_bigger(T1, T2).
all_bigger(nil, nil).

%Search
search(X, cons(X, _)).
search(X, cons(_, T)):- search(X, T).

%3.3 sublist
%List1 should contain elements all also in List2
sublist(cons(H, T), List2):- search(H, List2), sublist(T, List2).
sublist(nil, _).