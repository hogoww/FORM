(load "test.lisp")
(load "generationFunction.lisp")

(defun file-to-list (filename)
  (get-file-lisp (open filename) '()))

(defun get-file-lisp (file expr)
  (let ((x (read file nil)))
    (if (null x);EOF
	expr
      (get-file-lisp file (cons x expr)))))


(defun compile-all-prop (propList)
  (if (or (null propList) (null (car propList)))
      nil
    (cons (compile-that-prop (car proplist)) (compile-all-prop (cdr propList)))))

(defun compile-that-prop (prop &optional inPredicate)
  (if (null prop)
      "";we're done
    (let ((head (car prop)))
      (cond
       
       ;BinaryOp
       ((isOr head)
	(binaryGeneration "Or" prop))
       ((isAnd head)
	(binaryGeneration "And" prop))
       ((isImply head)
	(binaryGeneration "Imply" prop))
       ((isEqual head)
	(binaryGeneration "Equal" prop))

       ;UnaryOp
       ((isNot head)
	(unaryGeneration "Not" prop))

       ;Quantifier
       ((isExist head)
	(QuantifierGeneration "Exists" prop))
       ((isForAll head)
	(QuantifierGeneration "ForAll" prop))
	
       (t
	(if (not inPredicate)
	    (predicateAndFuncTermGenerator
	     (string head)
	     prop
	     'predicate);in a predicate, so term(s)
	  "in a predicate"))))))

(print (compile-all-prop (file-to-list "input.prop")))
