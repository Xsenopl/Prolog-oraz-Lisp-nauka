rodzic(zofia, marcin).
rodzic(andrzej, marcin).
rodzic(andrzej, kasia).
rodzic(marcin, ania).
rodzic(marcin, krzyœ).
rodzic(krzyœ, miko³aj).
kobieta(zofia).
kobieta(kasia).
kobieta(ania).
mê¿czyzna(andrzej).
mê¿czyzna(marcin).
mê¿czyzna(krzyœ).
mê¿czyzna(miko³aj).
potomek(Y,X):-
	rodzic(X,Y).
matka(X,Y):-
	rodzic(X,Y),
	kobieta(X).
dziadkowie(X,Z):-
	rodzic(X,Y),
	rodzic(Y,Z).
siostra(X,Y):-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(X).
szczêœliwy(X) :- rodzic(X,Y) , (kobieta(Y) ; mê¿czyzna(Y)).
dwoje_dzieci(X) :- rodzic(X, D1) , rodzic(X, D2),
    siostra(D1, D2) , D1 \= D2.
wnuk(X,Z) :- rodzic(Z,Y) , rodzic(Y,X).
ciotka(X, Y) :- rodzic(Z, Y),    siostra(X, Z).

nastêpca(X,Z) :- rodzic(Z,X).
nastêpca(X, Y) :- rodzic(Y, Z), nastêpca(X, Z).

% _Zadanie 2_ %
zatrudnienie(anna, nowak, zelmer, duza_firma, 2000).
zatrudnienie(maria, weso³owska, agata, ma³a_firma, 2500).
zatrudnienie(ola, kowal, ¿abka, duza_firma, 2501).
zatrudnienie(micha³, nowak, zelmer, duza_firma, 1499).
zatrudnienie(jan, panek, biedra, œrednia_firma, 1400).
zatrudnienie(janusz, kac, wsk, ma³a_firma, 3300).

zadowolona(I,N) :- zatrudnienie(I,N,_,ma³a_firma, Z) , Z > 2500.
du¿a_i_ma³o_kasy(I,N) :- zatrudnienie(I,N,_,duza_firma, Z), Z<1500.

