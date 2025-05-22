%2.1 size (List , Size )
% Size will contain the number of elements in List , written using notation zero , s( zero ), s(s( zero ))..

size(nil, zero).
size(cons(_, T), s(R)):- size(T, R).

%somma
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
