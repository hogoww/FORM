;or
(defun isOr (symb)
  (or (equal symb 'or) ;(equal symb '\\/)
      ))

;and
(defun isAnd (symb)
  (or (equal symb 'and) ;(equal symb '/\\)
      ))

;imply
(defun isImply (symb)
  (or (equal symb 'imply) ;(equal symb '/\\)
      ))

;equal
(defun isEqual (symb)
  (or (equal symb 'equal)
      ;(equal symb '/\\)
      ))

;not
(defun isNot (symb)
  (or (equal symb 'not)
      ))

;Exists
(defun isExist (symb)
  (or (equal symb 'Exist)
      ))

;ForAll
(defun isForAll (symb)
  (or (equal symb 'Forall)
      ))

;Predicate are have an upper case as first character
;(defun isPredicate(symb)
; (if (atom symb)
;      (upper-case-p (coerce symb 'character));if that's an atomic char
;    (upper-case-p (schar symb 0))));if it's a string, we check the first char

