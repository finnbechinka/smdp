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


% Noch mehr Listen

sum_ac([], X, R) :- X = R.
sum_ac([L|T], X, R) :- X2 is R + L, sum_ac(T, X, X2).

sum(L, X) :- sum_ac(L, X2, 0), X = X2.


addone([], []).
addone([A|TA], [B|TB]) :- B is A + 1, addone(TA, TB).

combine([], [], X, Y) :- X = Y.
combine([], [L2|T2], X, Y) :- combine([], T2, [L2|X], Y).
combine([L1|T1], [L2|T2], X, Y) :- combine(T1, [L2|T2], [L1|X], Y).


% permutation


contains([L|T], X) :- L = X; contains(T, X).

max_r([], _) .
max_r([L|T], Z) :-
  Z >= L, max_r(T, Z);
  fail.
max(L, Z) :- contains(L, Z), max_r(L, Z).
