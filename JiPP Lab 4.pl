pisz_list�([]).
pisz_list�([H|T]) :- write(H), write(' '),
    pisz_list�(T).

nale�y(E,[E|_]).
nale�y(E,[_|T]) :- nale�y(E,T).

dlugosc(D,[]) :- D is 0.
dlugosc(D,[_|H]) :- dlugosc(D1,H), D is D1 + 1.

��cz([],X,X).
��cz([H|T], Lista2, [H|Wynik]) :-
    ��cz(T, Lista2, Wynik).

dodaj(E,Lista, NowaLista) :-
    NowaLista = [E|Lista].
dodajVer2(E,Lista, [E|Lista]).
% aby doda� na sam koniec, trzeba pociacha� list� i u�y� potem predykatu ��cz

usunEl(X,[],[]).
usunEl(X,[X|T],NowaLista) :-
    usunEl(X,T,NowaLista).
usunEl(X,[H|T],[H|NowaLista]) :- X \= H,
    usunEl(X,T,NowaLista).
