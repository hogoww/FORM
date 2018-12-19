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
    (cons
     (concatenate
      'string
      (printIndent base-indent)
      (compile-that-prop (car proplist) (+ base-indent 1)))
     (compile-all-prop (cdr propList)))))

(defun compile-that-prop (prop indent)
  (if (null prop)
      "";we're done
    (let ((head (car prop)))
      (cond
       ;consts
       ((isTrueConst head)
	(constGeneration trueConstClass prop indent))
       ((isFalseConst head)
	(constGeneration falseConstClass prop indent))
       ;BinaryOp
       ((isOr head)
	(binaryGeneration orClass prop indent))
       ((isAnd head)
	(binaryGeneration andClass prop indent))
       ((isImply head)
	(binaryGeneration implyClass prop indent))
       ((isEqual head)
	(binaryGeneration equalClass prop indent))

       ;UnaryOp
       ((isNot head)
	(unaryGeneration notClass prop indent))

       ;Quantifier
       ((isExist head)
	(variadicQuantifierGeneration existsClass prop indent))
       ((isForAll head)
	(variadicQuantifierGeneration forallClass prop indent)) 
	
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




(mapc (lambda (x);remove the quotes, better printing
	(format t "~d

" x))
      (reverse;to put it back in the right order
       (compile-all-prop (file-to-list input-file))))
