; JiPP Lab 2 z Lispa. Zapoznianie z listami.
; Załadowanie pliku w clisp
; (load "E:/prywatny przed przniesieniem/studia/Jczyki i parad progr - VI sem/Laboratoria/JiPP Lab 6/JiPP Lab 6.lisp")

; Zadanie 1
(append (list 1 2 3 4 5) (list 6 7 8 9))

(defun polacz-listy (l1 l2) ; działa
    (if (null l1)
        l2
        (cons (car l1) (polacz-listy2 (cdr l1) l2))
    )
)

; Zadanie 2 
(reverse '(1 2 3 4 5))

(defun odwr1 (l1)
    (setq l2 '())
    (loop for i in l1 do
        (setq l2 (cons i l2))
;		(push i l2)				;Działa i push i setq, ale poprawniejsze jest chyba setq
    )
    (return-from odwr1 l2)
)

(defun odwr2 (lista)
  (if (null lista)
      '()
      (append (odwr2 (cdr lista)) (list (car lista)))
   )
)

;Zadanie 3
(defun palindrom1 (l1)
	(equal l1 (reverse l1)))
	
;Zadanie 4
(defun sort-ros1 (l1) (sort l1 #'>))

;Sortowanie przez wstawianie rosnąco
(defun insertion-sort (lista)
  (labels ((insert (element pos)
             (cond ((< pos 0) (cons element lista))
                   ((< element (nth pos lista)) (let ((nowa-lista (insert element (1- pos))))
                                                  (setf (nth (1+ pos) nowa-lista) (nth pos nowa-lista))
                                                  (setf (nth pos nowa-lista) element)
                                                  nowa-lista))
                   (t lista)))
		   )
    (loop for i from 1 below (length lista) do
          (let ((element (nth i lista)))
            (setf lista (insert element (1- i))))
	)
   )
  lista
)

;Sortowanie bąbelkowe rosnąco
(defun wstawelement (elem lista)      ;Funkcja pomocnicza
  (if (null lista)
    (list elem)
  (if (< elem (car lista))
      (cons elem lista)
  (cons (car lista) (wstawelement elem (cdr lista)))
  )  
  )
)
(defun buble-sort (lista)   
  (let (wynik '())
    (dolist (item lista)
      (setq wynik (wstawelement item wynik))
    )
  wynik
  )
)



;Zadanie 5
(defun iloczyn-list1 (l1 l2)
	(if (and (not (null l1)) (not (null l2)))
		(cons (* (car l1) (car l2)) (iloczyn-list (cdr l1) (cdr l2)))
	nil
	)
)
;Wersja pod okiem nauczyciela (w pełni zgodna z treścią)
(defun iloczyn-list2 (l1 l2)
  (if (or (null l1) (null l2))
    '()
  (cons (* (car l1) (car l2)) (iloczyn-list2 (cdr l1) (cdr l1)))
  )
)


;Zadanie 6 - ile liczb %3
(count-if #'(lambda (x) (= 0 (mod x 3))) '(1 2 3 4 5))

(defun dziel3 (x) (= (mod x 3) 0))
(defun ile-podzielnych-p3 (l1)
  (let ((licznik 0))
    (dolist (item l1)
      (if (dziel3 item)
        (setq licznik (+ licznik 1))
      )
    )
  licznik
  )
)

;Zadanie 7
(defun ile-podzielnych-pn (x l1)
	(count-if #'(lambda (o) (= 0 (mod o x))) l1)
)

(defun ile-podzielnych-pn2 (x l1)   ;coś nie działa
  (let ((licznik 0))
    (dolist (item l1)
      (if (= 0 (mod item x))
        (setq licznik (+ licznik 1))
      )
    )
  licznik
  )
)



;Zadanie 8
(defun podzielne-przez-5 (st)
  (let ((nowy-st '()))
    (loop while st do
          (let ((wartosc (pop st)))
            (when (and wartosc (= (mod wartosc 5) 0))
              (push wartosc nowy-st))
		   )
	)
    nowy-st
	)
)

;Zadanie 9
(defun generuj-liste (a b)
  (let ((lista '()))
    (loop for i from a to b do
          (push i lista)
	)
    lista
   )
)
;Zadanie 10 - ASCII
(defun generuj-liste-ascii (a b)
  (let ((lista '()))
    (loop for i from a to b do
          (push (code-char i) lista)
	)
    lista
   )
)

;W domu zrób switchem menu. Urzyj (format) oraz (read)

(defun menu ()
  (format t "~%===== MENU =====~%")
  (format t "1. Polacz listy~%")
  (format t "2. Odwroc liste v1~%")
  (format t "3. Odwroc liste v2~%")
  (format t "4. Palindrom~%")
  (format t "5. Bubble-sort~%")
  (format t "6. Podzielnych przez 3~%")
  (format t "7. Podzielnych przez pn~%")
  (format t "8. Stos a'la piatka~%")
  (format t "9. Generuj liste~%")
  (format t "10. Generuj liste ascii~%")
  (format t "44. Wyjdz~%")
  (format t "Wybierz opcje: ")
  (let ((opcja (read)))
    (case opcja
	   (1 (progn
           (format t "Podaj liste 1 (ar1 ar2 ar3): ")
           (let ((lista1 (read-from-string (read-line))))
				(format t "Podaj liste 2 (ar1 ar2 ar3): ")
			 (let ((lista2 (read-from-string (read-line))))
				(format t "Polaczone listy (wersja 1): ")
				(wyswietl-liste (polacz-listy lista1 lista2))
				(format t "~%")
			))
           (menu)	   
		   )
		)
      (2 (progn
           (format t "Podaj liste ((ar1 ar2 ar3): ")
           (let ((lista (read-from-string (read-line))))
             (format t "Odwrocona lista v1: ")
             (wyswietl-liste (odwr1 lista ))
             (format t "~%")
			)
           (menu)
         )
      )
      (3 (progn
           (format t "Podaj liste (ar1 ar2 ar3): ")
           (let ((lista (read-from-string (read-line))))
             (format t "Odwrocona lista v2: ")
             (wyswietl-liste (odwr2 lista))
             (format t "~%")
			)
           (menu)
         )
      )
	  (4 (progn
           (format t "Podaj palindrom (ar1 ar2 ar3): ")
           (let ((lista (read-from-string (read-line))))
             (format t "Czy to palindrom? ")
             (if (palindrom1 lista)
				(format t "T")
				(format t "nil"))
             (format t "~%")
			)
           (menu)
         )
      )
	  (5 (progn
           (format t "Podaj liste (ar1 ar2 ar3): ")
           (let ((lista (read-from-string (read-line))))
             (format t "Posostowana: ")
             (wyswietl-liste (buble-sort lista))
			 (format t "~%")
			)
           (menu)
         )
      )
	  (6 (progn
           (format t "Podaj liste (ar1 ar2 ar3): ")
           (let ((lista (read-from-string (read-line))))
             (format t "Ile podzielnych przez 3: ")
             (format t "~D"(ile-podzielnych-p3 lista))
			 (format t "~%")
			)
           (menu)
         )
      )
	  (7 (progn
           (format t "Podaj liste (ar1 ar2 ar3): ")
           (let ((lista (read-from-string (read-line))))  
             (format t "Ile podzielnych przez (napisz) ")
			(let ((x (read)))
             (format t "~D"(ile-podzielnych-pn x lista))
			 (format t "~%")
			))
           (menu)
         )
      )
	  (8 (progn
           (format t "Podaj liste (ar1 ar2 ar3): ")
           (let ((lista (read-from-string (read-line))))
             (format t "Lista podzielnych przez 5: ")
             (wyswietl-liste (podzielne-przez-5 lista))
			 (format t "~%")
			)
           (menu)
         )
      )
	  (9 (progn
           (format t "Podaj przedzial (dwie liczby): ")
           (let ((a (read)) (b (read)))
             (format t "Lista gererowana od do: ")
             (wyswietl-liste (generuj-liste a b))
			 (format t "~%")
			)
           (menu)
         )
      )
	  (10 (progn
           (format t "Podaj przedzial (dwie liczby ascii): ")
           (let ((a (read)) (b (read)))
             (format t "Lista gererowana od do: ")
             (wyswietl-liste (generuj-liste-ascii a b))
			 (format t "~%")
			)
           (menu)
         )
      )
      (44 (format t "Do widzenia!~%"))
      (t (progn
           (format t "Niepoprawna opcja. Wybierz ponownie.~%")
           (menu)
         )
      )
    )
  )
)

(defun wyswietl-liste (lista)
  (format t "~{~a ~}" lista)
)











