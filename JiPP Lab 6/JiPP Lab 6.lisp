; JiPP Lab 2 z Lispa. Zapoznianie z listami.
; Zadanie 1
(append (list 1 2 3 4 5) (list 6 7 8 9))

(defun polacz-listy1 (l1 l2) ; nie działa
    (dolist (x l2 l1)
        (cons x l1)
    )
    (return-from polacz-listy1 l1)
)

(defun polacz-listy2 (l1 l2) ; działa
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
        (push i l2)
    )
    (return-from odwr l2)
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

;Zadanie 5
(defun iloczyn-list (l1 l2)
	(if (and (not (null l1)) (not (null l2)))
		(cons (* (car l1) (car l2)) (iloczyn-list (cdr l1) (cdr l2)))
	nil
	)
)

;Zadanie 6 - ile liczb %3
(count-if #'(lambda (x) (= 0 (mod x 3))) '(1 2 3 4 5))
;Zadanie 7
(defun ile-podzielnych (x l1)
	(count-if #'(lambda (o) (= 0 (mod o x))) l1)
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














