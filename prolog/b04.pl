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

higher([_|_], []).
higher([_|T1T], [_|T2T]) :-
  subtower(_, [_|ST1T]), ST1T = T1T,
  subtower(_, [_|ST2T]), ST2T = T2T,
  higher(T1T, T2T).

highest(H) :- tower(H), \+ higher(_, H).


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
  Z >= L, max_r(T, Z).
max(L, Z) :- contains(L, Z), max_r(L, Z).


% Logikrätsel: Constraintprobleme in Prolog

linkesHaus(H, [H2|_]) :- H = H2.
nachbarn(H1, H2, [L1|[L2|T]]) :-
  H1 = L1, H2 = L2;
  H1 = L2, H2 = L1;
  nachbarn(H1, H2, [L2|T]).
rechts(H1, H2, [L1|[L2|T]]) :-
  H1 = L1, H2 = L2;
  rechts(H1, H2, [L2|T]).
mittleresHaus(H, [_,_,H,_,_]).
haus(H, L) :-
  linkesHaus(H, L);
  L = [_,H,_,_,_];
  mittleresHaus(H, L);
  L = [_,_,_,H,_];
  L = [_,_,_,_,H].

problem(X) :-
  X = [_,_,_,_,_],
  haus([rot, engländer, _, _, _], X),
  haus([_, spanier, hund, _, _], X),
  linkesHaus([_, norweger, _, _, _], X),
  haus([gleb, _, _, kools, _], X),
  nachbarn([_, _, _, chesterfields, _], [_, _, fisch, _, _], X),
  nachbarn([_, norweger, _, _, _], [blau, _, _, _, _], X),
  haus([_, _, schnecken, winston, _], X),
  haus([_, _, _, lucky_strike, orangensaft], X),
  haus([_, ukrainer, _, _, tee], X),
  haus([_, japaner, _, parliaments, _], X),
  nachbarn([_, _, pferd, _, _], [_, _, _, kools, _], X),
  haus([grün, _, _, _, kaffee], X),
  rechts([elfenbein, _, _, _, _], [grün, _, _, _, _], X),
  mittleresHaus([_, _, _, _, milch], X),
  haus([A, _, zebra, _, _], X),
  haus([B, _, _, _, wasser], X),
  write('Im '), write(A), write('en Haus wohnt das Zebra.'), nl,
  write('Im '), write(B), write('en Haus wird Wasser getrunken.').

