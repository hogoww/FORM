(defun binaryGeneration (operator prop)
  (let ((left (compile-that-prop (cadr prop)))
	(right (compile-that-Prop (caddr prop))))
    (concatenate
     'string
     operator
     " new:(
"
     left
     ")
rightProp:(
"
     right
     ")"
     )))

(defun unaryGeneration (operator prop)
  (let ((operand (compile-that-prop (cadr prop))))
    (concatenate
     'string
     operator
     " new:(
"
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
Property:(
"
	 operand
	 ")"
	 )))

;type = 'predicate or'functerm. 
(defun predicateAndFuncTermGenerator (symbName prop type)
  (let ((terms (compile-that-prop (cadr prop) t)))
    (concatenate
     'string
     (if (equal type 'predicate)
	 "Predicate"
       "Function")
     " new:'"
     symbName
     "' "
     (if (equal type 'predicate)
	 "fromList:"
       "Variables:")
     "(LinkedList new"
     terms
     "yourself)")
     ))

