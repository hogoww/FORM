;or
(defun isOr (symb)
  (or (equal symb 'or) (equal symb '\/)))

;Predicate are have an upper case as first character
(defun isPredicate(symb)
  (if (atom symb)
      (upper-case-p (coerce symb 'character));if that's an atomic char
    (upper-case-p (schar symb 0))));if it's a string, we check the first char

