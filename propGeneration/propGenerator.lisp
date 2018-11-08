#!/usr/bin/clisp

(load "configuration.lisp")
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
    (cons (compile-that-prop (car proplist) 0) (compile-all-prop (cdr propList)))))

(defun compile-that-prop (prop indent)
  (if (null prop)
      "";we're done
    (let ((head (car prop)))
      (cond
       ;BinaryOp
       ((isOr head)
	(binaryGeneration "Or" prop indent))
       ((isAnd head)
	(binaryGeneration "And" prop indent))
       ((isImply head)
	(binaryGeneration "Imply" prop indent))
       ((isEqual head)
	(binaryGeneration "Equal" prop indent))

       ;UnaryOp
       ((isNot head)
	(unaryGeneration "Not" prop indent))

       ;Quantifier
       ((isExist head)
	(QuantifierGeneration "Exists" prop indent))
       ((isForAll head)
	(QuantifierGeneration "ForAll" prop indent)) 
	
       (t;in a predicate
	(predicateGenerator prop indent))))))
	
(defun compile-those-terms (terms indent)
  (if (null terms);we're done on this branch
      "";f() case

    (let ((currentTerm (car terms)) (nextTerms (cdr terms)))
      (concatenate
       'string
       (if (atom currentTerm)
	   (termsGenerator currentTerm indent);else we're a simple term
	 (functionGenerator currentTerm indent));we're in a function
       (compile-those-terms nextTerms indent))
      )))


(mapc 'print (compile-all-prop (file-to-list "input.prop")))
