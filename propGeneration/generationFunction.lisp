

(defun printIndent (nb)
  (if (< nb 0)
      ""
    (concatenate
     'string
     indent-string
     (printIndent (- nb 1))
     )))

(defun binaryGeneration (operator prop indent)
  (let ((left (compile-that-prop (cadr prop) (+ 1 indent)))
	(right (compile-that-Prop (caddr prop) (+ 1 indent))))
    (concatenate
     'string
     operator
     " new:
"
     (printIndent indent)
"("
left
(printIndent indent)
")
"
     (printIndent (- indent 1));indent is supposed to be the caller one, so, -1.
"rightProp:
"
   (printIndent indent)
"("
right
(printIndent indent)
     ")
"
     )))

(defun unaryGeneration (operator prop indent)
  (let ((operand (compile-that-prop (cadr prop) (+ 1 indent))))
    (concatenate
     'string
     operator
     " new:
"
     (printIndent indent)
"("
operand
(printIndent indent)
     ")
"
     )))

(defun quantifierGeneration (operator prop indent)
  (let ((var (string-downcase (cadr prop)))
	(operand (compile-that-prop (caddr prop) (+ 1 indent))))
	(concatenate
	 'string
	 operator
	 " new:'"
	 var
	 "' Property:
"
	 (printIndent indent)
"("
operand
(printIndent indent)
	 ")
"
	 )))

;type = 'predicate or'functerm.
(defun predicateAndFuncTermGenerator (symbName terms type indent)
  (concatenate
   'string
   (if (equal type 'predicate)
       "Predicate"
     (concatenate
      'string
      (printIndent indent)
      "add:(Function"))
     " new:'"
     symbName
     "' "
     (if (equal type 'predicate)
	 "fromList:"
       "Variables:")
     "
"
(printIndent (+ indent 1))
"(LinkedList new 
"
     (compile-those-terms terms (+ indent 2))
(printIndent (+ indent 2))
"yourself)"
(if (equal type 'function)
    ")"
  )
"
"
))

;specialized way to call the same func
(defun predicateGenerator (prop indent)
  (predicateAndFuncTermGenerator (string (car prop))  (cdr prop) 'predicate indent))

(defun functionGenerator (prop indent)
  (predicateAndFuncTermGenerator (string (car prop)) (cdr prop) 'function indent))


(defun termsGenerator (term indent)
  (concatenate
   'string
   (printIndent indent)
   "add:(Term new:'"
(string-downcase term)
"');
"
))
