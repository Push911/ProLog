object(bike).
object(pencil).
object(clock).
object(camera).
object(buterfly).
object(fish).
left_of(pencil,clock).
left_of(clock,buterfly).
left_of(buterfly,fish).
above(bike,pencil).
above(camera,buterfly).

right_of(X,Y) :-
	left_of(Y,X).

below(X,Y) :-
	above(Y,X).

bottom(X) :-
	(right_of(X,_)
	-> true;
	left_of(X,_)).

higher(X,Y) :-
	bottom(Y),
	X \= Y,
	\+ bottom(X).
