;Zadnaie 1
(+ 2 (/ (* 3 4) 8)) ; => 7/2
;Zadanie 2
(+ (sin 12) (cos (mod 256 32)))

;Zadanie 3
;(handler-case (...) (error (c) ) ) obsługuje wyjątki
(defun suma (a b) 
	(handler-case (+ a b) 
		(error (e) (format t "Wystąpił błąd: ~a~%" e))
	)
)	

;Zadanie 4 - ~a powoduje, że w tym miejscu wyświetli się zmienna
(defun parzysta1 (liczba)
  (zerop (mod liczba 2))
)
;lub
(defun parzysta2 (a) 
	(if (zerop (mod a 2)) 
		(format t  "~a Jest parzysta~%" a) 
	(format t  "~a Nie jest parzyste~%" a)
	)
)

;Zadanie 5
(defun silnia1 (n)
	(if (<= n 1)
      1
      (* n (silnia (- n 1)))
	)
)

(defun silnia2 (n)
  (let ((wynik 1))
    (loop for i from 1 to n do
        (setf wynik (* wynik i))
	)
    wynik	;zwraca
   )
)

;Zadanie 6
(defun fib1 (x) 
	(if (< x 2) x					;możliwe, że zadziała też (when (< x 2) x)
	(let ((a 0) (b 1) (wynik 0))
		(loop repeat (- x 1) do
		(setf wynik (+ a b))
		(setf a b)
		(setf b wynik)	
		)
	wynik	
	)
	)
)

(defun fib2 (n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t (+ (fibonacci-rek (- n 1))
          (fibonacci-rek (- n 2))))
   )
)

;Zadanie 7
(defun suma-nieparzystych (a z)
  (let ((suma 0))
    (loop for i from a to z do
          (when (oddp i)			; kiedy parzysta
            (setf suma (+ suma i)))
	)
  suma
  )
)

;Zadanie 8
(defun suma-kwadratow (a z)
  (let ((suma 0))
    (loop for i from a to z do
          (setf suma (+ suma (* i i)))
	)
   suma
   )
)




	