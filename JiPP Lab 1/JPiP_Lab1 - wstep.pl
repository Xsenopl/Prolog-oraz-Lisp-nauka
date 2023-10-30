% Laboratorium 1 JPiP - Prolog - wstęp %
%_ZADANIE 1_%
parent( pam, bob).       % Pam is a parent of Bob
parent( tom, bob).
parent( tom, liz).
parent( bob, ann).
parent( bob, pat).
parent( pat, jim).

female( pam).            % Pam is female
female( liz).
female( ann).
female( pat).
  female(ala).
  female(ola).

male( jim).
male( tom).              % Tom is male
male( bob).
  male(seba).
  male(bart).
  male(jan).

child(X, Y) :- parent(Y, X).
mother(X, Y) :- parent(Y, X) , female(Y).
grandparent(X, Z) :- parent(Y, Z) , parent(X, Y).
sister(X, Y) :- parent(Z, X), parent(Z, Y) , female(X).

predecessor(X, Y) :- parent(X, Y).  % X jest przodkiem Y, jeśli X jest rodzicem Y
predecessor(X, Y) :- parent(X, Z), predecessor(Z, Y).  % X jest przodkiem Y, jeśli X jest rodzicem Z, a Z jest przodkiem Y


%_ZADANIE 2_%

wiek(ala,12).
wiek(ola,14).
wiek(liz,7).
wiek(ann,3).
wiek(seba,25).
wiek(bart,22).
wiek(jan,32).
wiek(bob,42).

hobby(ala, szycie).
hobby(ola, bieganie).
hobby(liz, lalki).
hobby(ann, smoczek).
hobby(seba, granie).
hobby(bart, imprezy).
hobby(jan, praca).
hobby(bob, tv).

starszy(X, Y) :- wiek(X, Wa), wiek(Y, Wb), Wa > Wb.
mlodszy(X, Y) :- wiek(X, Wa), wiek(Y, Wb), Wa < Wb.
rowny(X, Y) :- wiek(X, Wa), wiek(Y, Wb), Wa =:= Wb.


%_ZADANIE 3_%

osoba(bogdan, jacek, danuta, m, 22).
osoba(milosz, jacek, danuta, m, 25). 
osoba(jacek, stanislaw, wanda, m, 52).
osoba(danuta, mieczyslaw, minia, k, 45).
osoba(andrzej, mieczyslaw, minia, m, 42).
osoba(bartek, andrzej, gosia, m, 18).
osoba(pawel, andrzej, gosia, m, 16).

tata(X, Y) :- osoba(Y,X,_,_,_).
mama(X, Y) :- osoba(Y,_,X,_,_).
rodzic(X, Y) :- osoba(Y, X, _,_,_) ; osoba(Y, _, X, _,_).
rodzenstwo(X, Y) :- osoba(X, T, M, _,_) , osoba(Y, T, M, _,_) , X \= Y.
brat(X, Y) :- osoba(X, T, M, m,_) , osoba(Y, T, M, _,_) , X \= Y.
siostra(X, Y) :- osoba(X, T, M, k,_) , osoba(Y, T, M, _,_) , X \= Y.

kuzynostwo(X, Y) :- rodzic(R1, X) , rodzic(R2, Y) 
    , rodzenstwo(R1, R2) , X \= Y.

