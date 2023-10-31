rzecz(kot).
rzecz(kota).
rzecz(jan).
rzecz(ala).
rzecz(koñ).
rzecz(konia).
rzecz(lalka).
rzecz(twarz).
rzecz(kij).
czas(kupiæ).
czas(zabiæ).
czas(zbiæ).
czas(pog³askaæ).
czas(poca³owaæ).
czas(kochaæ).
czas(u¿yæ).
czas(wzi¹æ).
przym(zielony).
przym(³adny).
przym(brzydki).
przym(niewdziêczny).
przym(dobry).

sprawdz(X,Y,Z) :- ( rzecz(X),czas(Y),rzecz(Z) )
    -> write('Zdanie jest prawid³owe.');
       write('Zdanie jest b³êdne'), false.
sprawdz(F,G,H,I,J) :- ( przym(F), rzecz(G),czas(H), przym(I), rzecz(J) )
    -> write('Zdanie jest prawid³owe.');
       write('Zdanie jest b³êdne'), false.

d³ugoœæ(kontener1, 20).
d³ugoœæ(kontener2, 25).
szerokoœæ(kontener1,30).
szerokoœæ(kontener2,9).
wysokoœæ(kontener2, 10).
wysokoœæ(kontener1, 15).


obj(X) :-  d³ugoœæ(X,Y), szerokoœæ(X,Z), wysokoœæ(X,H), R is Y+Z+H, write(R).

% Niudana/nieskoñczona próba zapisu nierekurencyjnego
% nwd(X,Y) :- ( X >= 0, Y >= 0) -> write(X);
%      (X =< Y) -> write(Y-X); write(Y-X).
nwd(X,X,X) :- X>=0.
nwd(X,Y,D) :- ( X >= 0, Y >= 0) -> X<Y, R is Y-X, nwd(X,R,D); false.
nwd(X,Y,D) :- X>Y, nwd(Y,X,D).

