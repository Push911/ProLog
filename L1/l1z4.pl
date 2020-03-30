%	a8   a6
%	|    |
%	a7 - a5
%	     |
%	     a4
%	     |
%	a1 - a2
%	|    |
%	a0 - a3
%	|
%	a9

le(a9,a0).
le(a0,a1).
le(a1,a2).
le(a0,a3).
le(a3,a2).
le(a2,a4).
le(a4,a5).
le(a5,a6).
le(a5,a7).
le(a7,a8).

coll(X) :-
	le(X, _);
	le(_, X).

leq(X,X).

leq(X,Z) :- le(X,Z).
leq(X,Z) :-
	le(X,Y),
	leq(Y,Z).

biggest(X) :-
	forall(coll(Y), leq(Y, X)).
	
max(X) :-
	forall(coll(Y), (\+ (leq(X, Y)); X==Y)).

smallest(X) :-
	forall(coll(Y), leq(X, Y)).

min(X) :-
	forall(coll(Y), (\+ (leq(Y, X)); X==Y)).

