(setf input-file "input.prop")

;indent
(setf compact-mode nil);False if you want a well formed, easy to read. True if you want a conpact declaration
(setf indent-string " ");What the indent should look like
(setf base-indent 1);Where to start for the indent. For a function it's usually 1. for the playground usually 0.

;logic operators and constants
(setf trueConst '(True T));not implemented yet
(setf falseConst '(False F));not implemented yet
(setf orOp '(or))
(setf andOp '(and))
(setf implyOp '(-> imply))
(setf equalOp '(<=> equal))
(setf notOp '(~ not))
(setf existsOp '(exists))
(setf forallOp '(forall))

;Class related to each operator
(setf trueConst "True_Const");not implemented yet
(setf falseConst "False_Const");not implemented yet
(setf orClass "Or")
(setf andClass "And")
(setf implyClass "Imply")
(setf equalClass "Equal")
(setf notClass "Not")
(setf existsClass "Exists")
(setf forallClass "ForAll")

