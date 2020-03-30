le(a0,a1).
le(a1,a2).
le(a1,a3).
le(a2,a4).
le(a3,a4).

leq(X,X).

le(a0, a2).
le(a0, a3).
le(a0, a4).
le(a1, a4).

collection(X) :-
	le(X, _);
	le(_, X).

part_ord :-
	forall(collection(X), leq(X,X)),
	
	forall((collection(X), collection(Y), collection(Z)), 
		((le(X,Z); \+ (le(X,Y)); \+ (le(Y,Z))))
	),
	
	forall((collection(X), collection(Y)), 
		(\+ (le(X,Y)); \+ (le(Y, X)); X==Y)
	).











