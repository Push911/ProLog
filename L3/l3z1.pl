square([],[]).
square([H|T],[H2|T2]) :-
	square(T,T2),
	H2 is H ** 2.
	
sum([],0).
sum([H|T],X) :-
	sum(T,Y),
	X is Y + H.
	
variance(List,X) :-
	length(List,Len),
	square(List,Sq),
	sum(List,Sum),
	sum(Sq,Sum2),
	X is (Len * Sum2 - Sum ** 2) / Len ** 2.


