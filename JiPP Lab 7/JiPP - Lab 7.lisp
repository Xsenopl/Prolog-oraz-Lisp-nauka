(defun test (a b) (+ a b))
(defclass ksiazka ()
    (   ;get a potem set
        (tytul :initarg :tytul :accessor k-tytul)
        (autor :initarg :autor :accessor k-autor)
        (wydawnictwo :initarg :wydawnictwo :accessor k-wydawnictwo)
        (rok-wydania :initarg :rok-wydania :accessor k-rok-wydania)
        (isbn :initarg :isbn :accessor k-isbn)
))

(defmethod display-ksiazka ((s ksiazka))
  (format t "Tytul: ~A~%Autor: ~A~%Wydawanictwo: ~A~%Rok Wydania: ~D~%Isbn: ~A~%"
          (k-tytul s)
          (k-autor s)
          (k-wydawnictwo s)
          (k-rok-wydania s)
          (k-isbn s)
))

(defparameter *ks1*
    (make-instance 'ksiazka
                    :tytul "3 Bracia"
                    :autor "Brat Grimm"
                    :wydawnictwo "MAG"
                    :rok-wydania 1848
                    :isbn "ty1"
))
(defparameter *ks2*
    (make-instance 'ksiazka
                    :tytul "Miś"
                    :autor "Krzyś"
                    :wydawnictwo "Las"
                    :rok-wydania 1912
                    :isbn "ty2"
))

(defparameter *ks-lista* (list *ks1* *ks2*))