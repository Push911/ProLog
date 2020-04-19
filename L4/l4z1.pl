expression([H|T], Answer, X) :-
    solve(T, H, X),
    Answer is X.

equation(X, Y, X + Y).
equation(X, Y, X - Y).
equation(X, Y, X * Y).
equation(X, Y, X / Y) :- 
	Y =\= 0.

solve([], X, X).
solve([H|T], Answer, X) :-
    equation(Answer, H, NewAnswer),
    solve(T, NewAnswer, X).
solve([H, NH|T], Answer, X) :-
    equation(H, NH, Part),
    solve([Part|T], Answer, X).
