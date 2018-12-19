(defun equalOp (op listOp)
  (if (null listOp)
      nil;neutral for or
    (or (equal op (car listOp)) (equalOp op (cdr listOp)))))

(defun isTrueConst (symb)
  (equalOp symb trueConst))

(defun isFalseConst (symb)
  (equalOp symb falseConst))

    

;or
(defun isOr (symb)
  (equalOp symb orOp))

;and
(defun isAnd (symb)
  (equalOp symb andOp))

;imply
(defun isImply (symb)
  (equalOp symb implyOp))

;equal
(defun isEqual (symb)
  (equalOp symb equalOp))

;not
(defun isNot (symb)
  (equalOp symb notOp))

;Exists
(defun isExist (symb)
  (equalOp symb existsOp))

;ForAll
(defun isForAll (symb)
  (equalOp symb forallOp))
