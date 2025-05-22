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
