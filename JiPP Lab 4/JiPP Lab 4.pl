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

usunEl(_,[],[]).
usunEl(X,[X|T],NowaLista) :-
    usunEl(X,T,NowaLista).
usunEl(X,[H|T],[H|NowaLista]) :- X \= H,
    usunEl(X,T,NowaLista).

ostatni(_, [H]) :- write(H).
ostatni(E,[_|T]) :- ostatni(E, T), !.

pocz�tek([H],[H|_]) :- !.
pocz�tek([H|T],[G|O]) :- (H=G) -> pocz�tek(T,O); false, !.

%dopasuj([],_,_) :- !.
%dopasuj([H|T],[G|O],Z) :-
%    ( G=n, integer(H) ) -> dopasuj(T,O,Z1), dodaj(H,Z1,Z).
%

% Poni�sze rozwi�zanie pochodzi z internetu i nie dzia�a, gdy liczba
% argument�w Listy1 i Listy2 s� r�ne. Og�lnie to nie za bardzo pojmuj�
% czym jest . oraz * w tym zadaniu
dopasuj([], [], []).
%dopasuj([_|_],[],[]) :- !.
%dopasuj([],[_|_],[]) :- !.
dopasuj([H|T], [H|O], [H|TZ]) :-
    dopasuj(T, O, TZ).

dopasuj([H|T], [n|O], [H|TZ]) :-
    number(H),
    dopasuj(T, O, TZ).

dopasuj([H|T], [a|O], [H|TZ]) :-
    atom(H),
    dopasuj(T, O, TZ).

dopasuj([H|T], [l|O], [H|TZ]) :-
    is_list(H),
    dopasuj(T, O, TZ).

dopasuj([_|T], ['.'|O], [_|TZ]) :-
    dopasuj(T, O, TZ).

dopasuj(L, ['*'|O], Z) :-
    dopasuj(L, O, Z).
