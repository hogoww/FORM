(setf input-file "input.prop")

;indent
(setf compact-mode nil);False if you want a well formed, easy to read. True if you want a conpact declaration
(setf indent-string " ");What the indent should look like
(setf base-indent 1);Where to start for the indent. For a function it's usually 1. for the playground usually 0.

;logic operators and constants
(setf trueConst '(True T))
(setf falseConst '(False F))
(setf orOp '(or))
(setf andOp '(and))
(setf implyOp '(-> imply))
(setf equalOp '(<=> equal))
(setf notOp '(~ not))
(setf existsOp '(exists))
(setf forallOp '(forall))

;Class related to each operator
(setf trueConstClass "True_Const")
(setf falseConstClass "False_Const")
(setf orClass "Or")
(setf andClass "And")
(setf implyClass "Imply")
(setf equalClass "Equal")
(setf notClass "Not")
(setf existsClass "Exists")
(setf forallClass "ForAll")

