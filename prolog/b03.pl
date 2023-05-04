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

liegtImKontinent(deutschland, europa).
liegtImKontinent(frankreich, europa).
liegtImKontinent(china, asien).

stadtLiegtInKontinent(S, K) :- istHauptstadtVon(S, L), liegtImKontinent(L, K).

stadtLiegtInEuropa(S) :- stadtLiegtInKontinent(S, europa).
stadtLiegtInAsien(S) :- stadtLiegtInKontinent(S, asien).

liegenImGleichenKontinent(S1, S2) :- stadtLiegtInKontinent(S1, K), stadtLiegtInKontinent(S2, K).


