arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).


route(X, Z, V) :-
	arc(X, Y),
	\+(member(Y, V)),
	(Y = Z;
	route(Y,Z,[Y|V])).

available(X,Y) :-
	route(X,Y,[]).







