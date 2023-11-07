pisz_listê([]).
pisz_listê([H|T]) :- write(H), write(' '),
    pisz_listê(T).

nale¿y(E,[E|_]).
nale¿y(E,[_|T]) :- nale¿y(E,T).

dlugosc(D,[]) :- D is 0.
dlugosc(D,[_|H]) :- dlugosc(D1,H), D is D1 + 1.

³¹cz([],X,X).
³¹cz([H|T], Lista2, [H|Wynik]) :-
    ³¹cz(T, Lista2, Wynik).

dodaj(E,Lista, NowaLista) :-
    NowaLista = [E|Lista].
dodajVer2(E,Lista, [E|Lista]).
% aby dodaæ na sam koniec, trzeba pociachaæ listê i u¿yæ potem predykatu ³¹cz

usunEl(X,[],[]).
usunEl(X,[X|T],NowaLista) :-
    usunEl(X,T,NowaLista).
usunEl(X,[H|T],[H|NowaLista]) :- X \= H,
    usunEl(X,T,NowaLista).
