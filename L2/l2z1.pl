delete_last(L, L1) :-
    append(L1, [_], L).

delete_first([_|L], L).

delete_both(L, X) :-
	delete_first(L, L1),    
	delete_last(L1, LT),
	(LT = [X] ->  true;
	delete_both(LT, X)).
