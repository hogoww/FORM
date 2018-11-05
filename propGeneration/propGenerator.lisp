(load "test.lisp")

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
  (let ((head (car prop)))
    (cond
     ((isOr head)
      (let ((left (compile-that-prop (cadr prop)))
	    (right (compile-that-Prop (caddr prop))))
	(concatenate
	 'string
	 "Or new:"
	 left
	 " rightProp:"
	 right)))
     (t (string head)))))

(print (compile-all-prop (file-to-list "input.prop")))
