insertOdd(H,InList,[H|InList]).
insertOdd(H,[Y,Z|InList],[Y,Z|OutList]):-
    insertOdd(H,InList,OutList).

insertEven(H,[Y|InList],[Y,H|InList]).
insertEven(H,[Y,Z|InList],[Y,Z|OutList]):-
    insertEven(H,InList,OutList).

even_permutation([],[]).
even_permutation([H|T],Permutation):-
    even_permutation(T,Permutation1),
    insertOdd(H,Permutation1,Permutation).
even_permutation([H|T],Permutation):-
    odd_permutation(T,Permutation1),
    insertEven(H,Permutation1,Permutation).

odd_permutation([H|T],Permutation):-
    odd_permutation(T,Permutation1),
    insertOdd(H,Permutation1,Permutation).
odd_permutation([H|T],Permutation):-
    even_permutation(T,Permutation1),
    insertEven(H,Permutation1,Permutation).


