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

usunEl(_,[],[]).
usunEl(X,[X|T],NowaLista) :-
    usunEl(X,T,NowaLista).
usunEl(X,[H|T],[H|NowaLista]) :- X \= H,
    usunEl(X,T,NowaLista).

ostatni(_, [H]) :- write(H).
ostatni(E,[_|T]) :- ostatni(E, T), !.

pocz¹tek([H],[H|_]) :- !.
pocz¹tek([H|T],[G|O]) :- (H=G) -> pocz¹tek(T,O); false, !.

%dopasuj([],_,_) :- !.
%dopasuj([H|T],[G|O],Z) :-
%    ( G=n, integer(H) ) -> dopasuj(T,O,Z1), dodaj(H,Z1,Z).
%

% Poni¿sze rozwi¹zanie pochodzi z internetu i nie dzia³a, gdy liczba
% argumentów Listy1 i Listy2 s¹ ró¿ne. Ogólnie to nie za bardzo pojmujê
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
