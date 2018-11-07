#!/usr/bin/clisp

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

(defun compile-that-prop (prop)
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
	
       (t;in a predicate
	(predicateGenerator prop))))))
	
(defun compile-those-terms (terms)
  (if (null terms);we're done on this branch
      "";f() case

    (let ((currentTerm (car terms)) (nextTerms (cdr terms)))
      (concatenate
       'string
       (if (atom currentTerm)
	   (termsGenerator currentTerm);else we're a simple term
	 (functionGenerator currentTerm));we're in a function
       (compile-those-terms nextTerms))
      )))

(mapc 'print (compile-all-prop (file-to-list "input.prop")))
