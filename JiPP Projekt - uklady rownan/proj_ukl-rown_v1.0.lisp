(defun test (a) (+ a 2)) ; test, czy plik zaladowal sie poprawnie

; Przykłady użycia
; (rozwiaz-uklad2 2 3 7 4 5 8) ==> x=-5.5 y=6.0
; (rozwiaz-uklad3 2 1 -1 8 -3 -1 2 -11 -2 1 2 3) ==> x=-4 y=9 z=-7
; (rozwiaz-uklad3 2 1 -1 2 1 -1 1 -5 -3 2 0 17) ==> x=-1 y=7 z=3
; (gauss3 1 1 1 17 1 1 1 67 1 2 0 17) ==> błedne wywolanie
; (rozwiaz-uklad4 1 1 1 1 2 1 -1 1 1 -2 1 -1 -1 1 -2 2 1 1 -1 5) ==> w=1 x=2 y=0 z=-1
; (rozwiaz-uklad4 2 1 -1 1 8 -3 -1 2 -2 -11 4 1 -2 -3 2 1 2 3 4 30) ==>  w= 4.8235292, x= 0.1764706, y= 4.5882354, z= 2.764706 
; (rozwiaz-uklad4 1 1 1 1 122 1 1 1 1 123 4 1 1 111 1 122 2 1 2 -123) ==> Uklad rownan nie ma jednoznacznego rozwiazania.

;Cramer 2-nw
(defun rozwiaz-uklad2 (a b c d e f)
	(let ((det (* (- (* a e) (* b d)) 1.0)))								; wyznacznik obliczony metoda Sarrusa
		(if (zerop det)
			(format t "Uklad rownan nie ma jednoznacznego rozwiazania.")
			
			(let ((det-x (/ (- (* c e) (* b f)) det))
				(det-y (/ (- (* a f) (* d c)) det)))
				(format t "Wynik: x = ~a, y = ~a" det-x det-y)
		))
))

;Cramer 3-nw
(defun rozwiaz-uklad3 (a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4)	
	(let ((det (liczdet3 a1 a2 a3 b1 b2 b3 c1 c2 c3)))
		(if (zerop det)
			(format t "Uklad rownan nie ma jednoznacznego rozwiazania.")
			
			(let (	(det-x (/ (liczdet3 a4 a2 a3 b4 b2 b3 c4 c2 c3) det))
					(det-y (/ (liczdet3 a1 a4 a3 b1 b4 b3 c1 c4 c3) det))
					(det-z (/ (liczdet3 a1 a2 a4 b1 b2 b4 c1 c2 c4) det)))
				(format t "Wynik: x = ~a, y = ~a, z = ~a" det-x det-y det-z)
		))
))

;Cramer 4-nw
(defun rozwiaz-uklad4 (a1 a2 a3 a4 aa5
						b1 b2 b3 b4 bb5
                        c1 c2 c3 c4 cc5
                        d1 d2 d3 d4 dd5)														; przeslanie argumentow
	(let ((det (liczdet4 a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4)))						; obliczanie wyznacznika macierzy glownej poprzez wywołanie metody (liczdet4)
		(if (zerop det)																			; jesli det jest rowny zeru, to niemozliwe jest znalezienie jednoznacznego rozwiazania
			(format t "Uklad rownan nie ma jednoznacznego rozwiazania.")
			
			(let ((det-w (/ (liczdet4 aa5 a2 a3 a4 bb5 b2 b3 b4	cc5 c2 c3 c4 dd5 d2 d3 d4) det)); det-[atom] to juz obliczona wartosc niewiadomej, choc w trakcie tego jest tez obliczany wyznacznik macierzy [atom]
				(det-x (/ (liczdet4 a1 aa5 a3 a4 b1 bb5 b3 b4 c1 cc5 c3 c4 d1 dd5 d3 d4) det))		
				(det-y (/ (liczdet4 a1 a2 aa5 a4 b1 b2 bb5 b4 c1 c2 cc5 c4 d1 d2 dd5 d4) det))			
				(det-z (/ (liczdet4 a1 a2 a3 aa5 b1 b2 b3 bb5 c1 c2 c3 cc5 d1 d2 d3 dd5) det)))
						
				(format t "Wynik: w = ~a, x = ~a, y = ~a, z = ~a" det-w det-x det-y det-z)		; na kocnu otrzymujemy wynik
		))
))

;Liczy det macierzy 3 stopnia za pomocą metody Sarrusa
(defun liczdet3 (a1 a2 a3 b1 b2 b3 c1 c2 c3)
	(* (- 
		(+ (* a1 b2 c3)	(* b1 c2 a3)	(* c1 a2 b3))
		(+ (* c1 b2 a3) (* a1 c2 b3)	(* b1 a2 c3))
		)1.0)															; zwracana jest sama wartosc liczbowa
)
;Liczy det macierzy 4 stopnia z zastosowaniem rozwiniecia Laplace’a.
(defun liczdet4 (a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4)		
	(+ (* a1 (expt -1 (+ 1 1)) (liczdet3 b2 b3 b4 c2 c3 c4 d2 d3 d4))	; Wybierany jest pierwszy wiersz, ktory decyduje o znaku +, czy - (funkcja (expt)).
		(* a2 (expt -1 (+ 1 2)) (liczdet3 b1 b3 b4 c1 c3 c4 d1 d3 d4))	; To przez jego wartosci mnozone są wyznaczniki z pozostalych utworzonych macierz.
		(* a3 (expt -1 (+ 1 3)) (liczdet3 b1 b2 b4 c1 c2 c4 d1 d2 d4))	; Funkcja odwoluje się do funkcji (liczdet3)
		(* a4 (expt -1 (+ 1 4)) (liczdet3 b1 b2 b3 c1 c2 c3 d1 d2 d3))
	)
)

;Metoda Gaussa
(defun gauss3 (a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4)
	(let ( (tt (jedynka a1 b1)))		; obliczany jest wspolczynnik, ktory wyznacza zaleznosc wiersza 1 od 2
		(setf b1 (+ (* a1 tt) b1))		; dodawanie wierszy macierzy. Wiersz wyzej jest pomnozony przez wspolczynnik
		(setf b2 (+ (* a2 tt) b2))
		(setf b3 (+ (* a3 tt) b3))
		(setf b4 (+ (* a4 tt) b4))
		
		(setf tt (jedynka a1 c1))		; obliczany jest wspolczynnik, ktory wyznacza zaleznosc wiersza 1 od 3
		(setf c1 (+ (* a1 tt) c1))		
		(setf c2 (+ (* a2 tt) c2))
		(setf c3 (+ (* a3 tt) c3))
		(setf c4 (+ (* a4 tt) c4))
		
		(setf tt (jedynka b2 c2))		; obliczany jest wspolczynnik, ktory wyznacza zaleznosc wiersza 2 od 3
		(setf c2 (+ (* b2 tt) c2))
		(setf c3 (+ (* b3 tt) c3))
		(setf c4 (+ (* b4 tt) c4))	
		
		
		(let* ( (x3 (* 1.0 (dajx c1 c2 c3 c4)))					; obliczane sa niewiadome x3, x2, x1. Ktory x jest liczony, to ta pozycja laduje jako argument 3
				(x2 (* 1.0 (dajx b1 (* b3 x3) b2 b4)))
				(x1 (* 1.0 (dajx (* a2 x2) (* a3 x3) a1 a4)))
				)
			(format t "Wynik: x1 = ~a, x2 = ~a, x3 = ~a," x1 x2 x3)		
		)
))

;Oblicza wartosc niewiadomej. Bardzo wazna jest kolejnosc argumentow przy wywolaniu, gdyz zostala ustalona od pozycji c3 w macierzy podczas pracy funkcji (gauss3)
(defun dajx (a b c d)
	(let ( (x (/ (- d a b) c)) )
		(return-from dajx x)
	)
)
; Oblicza uklad rownan z jedna niewiadoma ax + b = 0
(defun jedynka (a b)
	(/ (* -1 b) a)
)
