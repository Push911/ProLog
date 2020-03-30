list(N, X) :-
    numlist(1, N, A),
    odd(X, A),
    permutation(A, B),
    even(X, B).      

odd([], []).
odd([X, _|L], [X|R]) :- 
    odd(L, R).

even([], []).
even([_, X|L], [X|R]) :-    
    even(L, R).


