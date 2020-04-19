field(black, '::::::').
field(white, '      ').
captain(black, ':####:').
captain(white, ' #### ').

captains(Amount, Board) :-
	numlist(1, Amount, L),
	permutation(L, Board),
	good(Board).

good(Board) :-
	\+ bad(Board).

bad(Board) :-
	append(_, [Row | L1], Board),
	append(L2, [Column | _], L1),
	length(L2, C),
	abs(Row - Column) =:= C + 1.

board(Amount) :-
	captains(Amount, Board),
	createBoard(Board).

createBoard(Board) :-
	length(Board, Amount),
	startColor(Amount, Color),
	createBoard(Amount, Amount, Board, Color).

startColor(Amount, Color) :- 
	0 is Amount mod 2 ->  (Color = white);
	(Color = black).

changeColor(white, black).
changeColor(black, white).

createBoard(Amount, 0, _, _) :-
	row(Amount), !.

createBoard(Amount, C, Captains, Color) :-
	row(Amount), 
	nl,
	column(C, Captains, Color),
	column(C, Captains, Color),
	changeColor(Color, NextColor),
	C1 is C - 1,
	createBoard(Amount, C1, Captains, NextColor).


row(0) :-
	write('+'), !.

row(Amount) :-
	write('+------'),
	A1 is Amount - 1,
	row(A1).

column(_, [], _) :-
	write('|'), nl, !.

column(C, [F|T], Color) :-
	write('|'),
	content(C, F, Color, Answer),
	write(Answer),
	changeColor(Color, NextColor),
	column(C, T, NextColor).


content(Amount, Amount, Color, Answer) :-
	captain(Color, Answer), !.

content(_, _, Color, Answer) :-
	field(Color, Answer).
    

