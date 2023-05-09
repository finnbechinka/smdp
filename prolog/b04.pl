% Klötzchenwelt

on(a,b).
on(b,table).
on(c,d).
on(d,table).
on(e,table).
on(f,g).
on(g,h).
on(h,table).

top(X) :- on(X, _), \+ on(_, X).

subtower(El, T) :-
  on(El, X), subtower(X, T2), T = [El | T2];
  \+ on(El, _), T = [].


tower(T) :- [TH|_] = T, top(TH), subtower(TH, T2), T = T2.

higher([_|_], []) :- true.
higher([_|T1T], [_|T2T]) :- higher(T1T, T2T).

highest(H) :- tower(T), T \= H, higher(H, T).
