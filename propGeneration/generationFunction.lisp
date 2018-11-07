(defun binaryGeneration (operator prop)
  (let ((left (compile-that-prop (cadr prop)))
	(right (compile-that-Prop (caddr prop))))
    (concatenate
     'string
     operator
     " new:
("
     left
     ")
rightProp:
("
     right
     ")"
     )))

(defun unaryGeneration (operator prop)
  (let ((operand (compile-that-prop (cadr prop))))
    (concatenate
     'string
     operator
     " new:
("
     operand
     ")"
     )))

(defun quantifierGeneration (operator prop)
  (let ((var (string-downcase (cadr prop)))
	(operand (compile-that-prop (caddr prop))))
	(concatenate
	 'string
	 operator
	 " new:'"
	 var
	 "'
Property:
("
	 operand
	 ")"
	 )))

;type = 'predicate or'functerm.
(defun predicateAndFuncTermGenerator (symbName terms type)
  (concatenate
   'string
   (if (equal type 'predicate)
       "Predicate"
     "add:
(Function")
     " new:'"
     symbName
     "' "
     (if (equal type 'predicate)
	 "fromList:"
       "Variables:")
     "(LinkedList new "
     (compile-those-terms terms)
;     (if (not (equal type 'predicate)); CARE "NOT" HERE
         ""
 ;    )
     "yourself)"
))

;specialized way to call the same func
(defun predicateGenerator (prop)
  (predicateAndFuncTermGenerator (string (car prop))  (cdr prop) 'predicate))

(defun functionGenerator (prop)
  (predicateAndFuncTermGenerator (string (car prop)) (cdr prop) 'function))


(defun termsGenerator (term)
  (concatenate
   'string
   "add:
(Term new:'"
(string term)
"');"
))

