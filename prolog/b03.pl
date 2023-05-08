% Wissensbasis erstellen

buch(buch1, author1, drama).
buch(buch2, author1, krimi).
buch(buch3, author1, comedy).

buch(buch4, author2, drama).
buch(buch5, author2, krimi).
buch(buch6, author2, comedy).
buch(buch7, author2, krimi).

% buch(X, A, _).
% buch(X, A, G).


% Hauptstädte, Länder, Kontinente

istHauptstadtVon(berlin, deutschland).
istHauptstadtVon(paris, frankreich).
istHauptstadtVon(peking, china).
istHauptstadtVon(tokyo, japan).

liegtImKontinent(deutschland, europa).
liegtImKontinent(frankreich, europa).
liegtImKontinent(china, asien).
liegtImKontinent(japan, asien).

stadtLiegtInKontinent(S, K) :- istHauptstadtVon(S, L), liegtImKontinent(L, K).

stadtLiegtInEuropa(S) :- stadtLiegtInKontinent(S, europa).
stadtLiegtInAsien(S) :- stadtLiegtInKontinent(S, asien).

liegenImGleichenKontinent(S1, S2) :- stadtLiegtInKontinent(S1, K), stadtLiegtInKontinent(S2, K).


% Einfache Listen
rev_ac([], A, R) :- R = A.
rev_ac([L| LT], A, R) :- rev_ac(LT, [L|A], R).
rev(L, R) :- rev_ac(L, [], R).

trans_a_b_ac([], A, Y) :- rev(A, R), R = Y.
trans_a_b_ac([X|TX], A, Y) :- X = a, trans_a_b_ac(TX, [b|A], Y); X \= a, trans_a_b_ac(TX, [X|A], Y).
trans_a_b(X,Y) :- trans_a_b_ac(X, [], Y).

% takeout_ac(X, [], A, R) :- rev(A, R).
% takeout_ac(X, [L, TL], A, R) :- X = L, takeout_ac(X, TL, A, R); takeout_ac(X, TL, [L, A], R).
% takeout(X, L, R) :- takeout_ac(X, L, [], R).

% takeout(X, [L, TL], R) :- X = L, takeout(X, TL, R); takeout(X, TL, [L|R]).

palindrom_ac([], A, VL) :- A = VL.
palindrom_ac([L|TL], A, VL) :- palindrom_ac(TL, [L|A], VL).
palindrom(L) :- palindrom_ac(L, [], L).

% Färbungsproblem

country(wa).
country(nt).
country(sa).
country(ql).
country(nsw).
country(tas).
country(vi).

neighbors(wa, nt).
neighbors(wa, sa).
neighbors(nt, wa).
neighbors(nt, sa).
neighbors(nt, ql).
neighbors(sa, wa).
neighbors(sa, ql).
neighbors(sa, nt).
neighbors(ql, nt).
neighbors(ql, nsw).
neighbors(ql, sa).
neighbors(nsw, sa).
neighbors(nsw, vi).
neighbors(nsw, ql).
neighbors(vic, sa).
neighbors(vic, nsw).

% color(C, COL) :- color(C, 1); color(C, 2); color(C, 3).

% :- neighbors(C1, C2), color(C1, COL1), color(C2, COL2), COL1 \= COL2.
