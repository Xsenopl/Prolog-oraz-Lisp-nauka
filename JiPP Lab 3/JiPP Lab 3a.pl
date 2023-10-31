rzecz(kot).
rzecz(kota).
rzecz(jan).
rzecz(ala).
rzecz(ko�).
rzecz(konia).
rzecz(lalka).
rzecz(twarz).
rzecz(kij).
czas(kupi�).
czas(zabi�).
czas(zbi�).
czas(pog�aska�).
czas(poca�owa�).
czas(kocha�).
czas(u�y�).
czas(wzi��).
przym(zielony).
przym(�adny).
przym(brzydki).
przym(niewdzi�czny).
przym(dobry).

sprawdz(X,Y,Z) :- ( rzecz(X),czas(Y),rzecz(Z) )
    -> write('Zdanie jest prawid�owe.');
       write('Zdanie jest b��dne'), false.
sprawdz(F,G,H,I,J) :- ( przym(F), rzecz(G),czas(H), przym(I), rzecz(J) )
    -> write('Zdanie jest prawid�owe.');
       write('Zdanie jest b��dne'), false.

d�ugo��(kontener1, 20).
d�ugo��(kontener2, 25).
szeroko��(kontener1,30).
szeroko��(kontener2,9).
wysoko��(kontener2, 10).
wysoko��(kontener1, 15).


obj(X) :-  d�ugo��(X,Y), szeroko��(X,Z), wysoko��(X,H), R is Y+Z+H, write(R).

% Niudana/niesko�czona pr�ba zapisu nierekurencyjnego
% nwd(X,Y) :- ( X >= 0, Y >= 0) -> write(X);
%      (X =< Y) -> write(Y-X); write(Y-X).
nwd(X,X,X) :- X>=0.
nwd(X,Y,D) :- ( X >= 0, Y >= 0) -> X<Y, R is Y-X, nwd(X,R,D); false.
nwd(X,Y,D) :- X>Y, nwd(Y,X,D).

