%part 0a

a.
a.
a:-d.
b.
c:-a, b.
c:-c.

%a,b = ab. ab.

%c,d = loop

%part 0b
a(1).
a(X) :-b(X), b(X).
b(1).
b(2).
c(X) :-b(X).
c(X) :-b(X), c(X).

%c(1)-> sì, loop
%c(Y)-> Y/1, Y/2, loop
%b(Y), b(z)-> Y/1 Z/1, Y/1  Z/2, Y/2  Z/1, Y/2  Z/2