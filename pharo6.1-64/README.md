


Load the package with "Monticello Browser":
-left click in Pharo's World (the background)-> "Monticello Browser" (should be in the first section)
-In the newly opened window click on "+Repository" -> Directory
-Choose the right directory
-Choose the last version of the package and click "load"



    	  ###  General testing  ###

There's two types of tests available.
Automated testing for some part of the program throught Unit Testing. Those are explicitated in each test class documentation and in the state of the program part of this file.
Textual testing available in the Prop metaclass. They can be run in the playground using 'Prop TestName.' and using the Ctrl+D command on that line, and the result will show on a Transcript (which needs to be open).


    	  ###  State of the program  ###


The resolution method was build using 4 distinct steps
-Skolemisation
-Clausification
-Formal Clause
-Resolution method
--Unification



    	  ###  Skolemisation  ###

The process is completely implemented.
Some automated tests are available in the TestSkolemnisation class, but aren't covering.



Although there was a question (left unanswered so far) of the validity of the rules in the specifications.
s(∃x.Φ) = s(Φ)
Given that every other rules are symetric, and that the symetric change function:
h(∀x.Φ) = s(Φ)
We weren't able to find another source to confirm or deny this.

    	  ###  Clausification  ###


