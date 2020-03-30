max([],0,0).
max([H|T],Sum,Max) :-
	max(T,Sum2,Max2),
	((Sum2 + H < 0) -> (Sum is 0);
	(Sum is Sum2 + H)),
	(Sum > Max2 -> Max is Sum;
	 Max is Max2).

max_sum(Lista,Max) :-	
	max(Lista,_,Max).
