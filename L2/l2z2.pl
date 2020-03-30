oneTime(List, X) :-
	select(X, List, ExecList),
	\+(select(X, ExecList, ExecutList)).
	
twoTimes(List, X) :-
	select(X, List, ExecList),
	select(X, ExecList, ExecutList),
	\+(select(X, ExecutList, ExecuteList)).
