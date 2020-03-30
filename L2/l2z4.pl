rule(X, /, Y, _) :-
	number(Y),
	(Y =:= 0),
	halt,!.

rule(X, +, Y, Y) :-
	number(X),
	X =:= 0, !.
	
rule(X, +, Y, X) :-
	number(Y),
	Y =:= 0, !.

rule(X, +, Y, Answer) :-
	Answer = X+Y,!.	

rule(X+Y, +, X, 2*X+Y) :-
	atomic(X),
	atomic(Y),!.

rule(X+Y, -, X, Y) :-
	atomic(X),
	atomic(Y),!.
	
rule(X/Y, *, Y, X) :-
	atomic(X),
	atomic(Y),!.

rule(X*Y, /, X, Y) :-	
	atomic(X),
	atomic(Y),!.

rule(X*Y, /, Y, X) :-	
	atomic(X),
	atomic(Y),!.

rule(X/Y, /, X, 1/X) :-	
	atomic(X),
	atomic(Y),!.
	
rule(X/X, /, Y, 1/Y) :-	
	atomic(X),
	atomic(Y),!.	

rule(X, -, Y, 0) :-	
	atomic(X),
	atomic(Y),
	X = Y, !.	

rule(X, -, Y, X) :-
	number(Y),
	Y =:= 0, !.

rule(X, -, Y, -Y) :-
	number(X),
	X =:= 0, !.
	

rule(X, -, Y, Answer) :-
	Answer = X-Y,!.	
	

rule(X, *, Y, X) :-	
	number(Y),
	Y =:= 1, !.
	
rule(X, *, Y, Y) :-	
	number(X),
	X =:= 1, !.	
	
rule(X, *, Y, 0) :-	
	number(Y),
	Y =:= 0, !.
	
rule(X, *, Y, 0) :-	
	number(X),
	X =:= 0, !.

	
rule(X, *, Y, Answer) :-
	Answer = X*Y,!.

rule(X, /, Y, 0) :-
	number(X),
	X =:= 0, !.	
	
rule(X, /, X, 1) :-
	atomic(X),
	number(X),
	X =\= 0, !.		
	
rule(X, /, X, 1) :-
	atomic(X),!.	
	
rule(X, /, Y, Answer) :-
	Answer = X/Y,!.


rule(X-Y, +, Y, X) :-
	atomic(X),
	atomic(Y),!.

simplify(Expression,Answer) :-
	Expression =.. [Sign, Expr1, Expr2],
	simplify(Expr1, Answer1),
	simplify(Expr2, Answer2),
	rule(Answer1, Sign, Answer2, Answer).

simplify(Expression, Answer) :- 
	(
		atomic(Expression); 
		number(Expression)
	),
	Expression = Answer.	
	


	
