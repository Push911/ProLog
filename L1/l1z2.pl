on(b1,b2).
on(b2,b3).
on(b3,b4).
on(b4,b5).
on(b5,b6).
on(b6,b7).
on(b7,b8).
on(b8,b9).

above(X,Y) :-
	on(X,Y).

above(X,Y) :-
	on(X,Z),
	above(Z,Y).
	
