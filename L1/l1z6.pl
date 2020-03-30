check(X,Y) :-
	foreach(between(X,Y,A),
	isPrime(A) -> writeln(A); !).

isPrime(A) :-
	not((A1 is A-1,
		between(2,A1,N), 
		0 is mod(A,N))),
	not(A is 1).
 
