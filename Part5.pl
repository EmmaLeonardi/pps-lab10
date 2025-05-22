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

%if the first element is > than the second one
greater(s(_), zero).
greater(s(N), s(M)):- greater(N, M).

%if the first element is <= than the second one
smallerEqual(zero, s(_)).
smallerEqual(zero, zero).
smallerEqual(s(N), s(M)):- smaller(N, M).

%5.3 List.filter(_>0)
%returns the input list without any zero element
filter(cons(H1, T1), cons(H1, T2)):- greater(H1, zero), filter(T1, T2).
filter(cons(H1, T1), List2):- smallerEqual(H1, zero), filter(T1, List2).
filter(nil, nil).
%es cons(zero, cons(s(zero), nil)-> cons(s(zero), nil)
%es cons(zero, nil)->nil
