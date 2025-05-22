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

%2.1 size (List , Size )
% Size will contain the number of elements in List , written using notation zero , s( zero ), s(s( zero ))..
size(nil, zero).
size(cons(_, T), s(R)):- size(T, R).

%sum of two elements
sum(A, zero, A). %a+0=a
sum(A, s(B), s(C)):- sum(A, B, C).

%2.2 sum_list
sum_list(nil, zero).
sum_list(cons(H, T), Res):- sum_list(T, TailCount), sum(TailCount, H, Res).

%2.3 count occurrences
count(List, E, N):- count (List, E, zero, N). %count how many times E is present in List. Starts with zero occurrences
count(nil, E, N, N). %when the list is nil end of recursion
count(cons(E, L), E, N, M):- count (L, E, s(N), M). %when the element in head is the same as element, increment count and keep recurring on tail
count(cons(E, L), E2, N, M):- E\= E2 , count (L, E2, N, M). %if the head element is not head, keep searching on the tail

%util functions
%if the first element is > than the second one
greater(s(_), zero).
greater(s(N), s(M)):- greater(N, M).

%if the first element is <= than the second one
smallerEqual(zero, s(_)).
smallerEqual(zero, zero).
smallerEqual(s(N), s(M)):- smaller(N, M).

%2.4 max
max(List, Max):- max(List, zero, Max). %searches for the max in the list, initially set to zero
max(nil, M, M). %end of list, max is the value in M
max(cons(H,T), TempMax, Max) :- greater(H,TempMax), max(T, H, Max). %if the head is bigger than the known max, the head becomes the known max
max(cons(H,T), TempMax, Max) :- max(T, TempMax, Max). %if the head is smaller or equal than the known max, keep searching on the list

min(cons(H, T), Min):- min(T, H, Min). %searches for the min in the list, initially set to the first element
min(nil, zero). %the min of a nil list is zero
min(nil, M, M). %end of list, min is the value in M
min(cons(H,T), TempMin, Min) :- smallerEqual(H,TempMin), min(T, H, Min). %if the head is smaller than the known min, the head becomes the known min
min(cons(H,T), TempMin, Min) :- min(T, TempMin, Min). %if the head is bigger than the known min, keep searching on the list

%2.5 min-max
min-max(List, Min, Max):- max(List, Max), min(List, Min).

%3.1 same list
same(cons(H, T1), cons(H, T2)):- same(T1, T2). %the lists are the same if the head element is the same and all the tail is the same
same(nil, nil). %two empty lists are the same

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

%4.1 seq
%seq (N ,E , List ) --> List is [E ,E ,... , E ] with size N
seq(zero, _, nil).
seq(s(N), E, cons(E, T)):-seq(N, E, T).


%4.2 seqR
%seq (N, List) ->List is N, N-1, N-2,... zero
seqR(zero, nil).
seqR(s(N), cons(N, T)):-seqR(N, T). 

%add last Element to given list
addLast(Elem, nil, cons(Elem, nil)).
addLast(Elem, cons(H,T), cons(H, L)):- addLast(Elem, T, L).

%4.3 seqR2
%seq2 (N, List)-> List is zero, s(zero), ...
seqR2(zero, nil).
seqR2(s(N), R):- seqR2(N, L), addLast(N, L, R). 

%5.1 List.last
%gets the last element of a list, returns nil if list is nil
last(nil, nil).
last(cons(H, nil), H). 
last(cons(_, T), E):- last(T, E).
%es cons(a, cons(b, nil))-> last element is b
%es cons(a, nil)-> last element is a

%5.2 List.map(element+1)
%Maps each element of a list to its successor. The successor of nil is nil
map(cons(H1, T1), cons(s(H1), T2)):-map(T1, T2).
map(nil, nil).
%es cons(s(zero), cons(s(s(zero)))-> cons(s(s(zero)), cons(s(s(s(zero)), nil))
%es cons(zero, nil)-> cons(s(zero), nil)

%5.3 List.filter(_>0)
%returns the input list without any zero element
filter(cons(H1, T1), cons(H1, T2)):- greater(H1, zero), filter(T1, T2).
filter(cons(H1, T1), List2):- smallerEqual(H1, zero), filter(T1, List2).
filter(nil, nil).
%es cons(zero, cons(s(zero), nil)-> cons(s(zero), nil)
%es cons(zero, nil)->nil
