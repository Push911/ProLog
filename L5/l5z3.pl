#Usage browse(f1(f2(a2, a3), a1, f3(a4))).

browse(Term) :-
    browse(Term, []).

browse(Term, History) :-
	write(Term), 
	nl, 
	write('Command: '), 
	flush, 
	read(Command),
	new_command(Command, Term, History).

new_command(n, _, []).
new_command(n, Term, History) :-
	next(Term, History, NewTerm, NewHistory),
	browse(NewTerm, NewHistory).

new_command(p, _, []).
new_command(p, Term, History) :-
	prev(Term, History, NewTerm, NewHistory),
	browse(NewTerm, NewHistory).

new_command(i, Term, History) :- 
	in(Term, History, NewTerm, NewHistory),
	browse(NewTerm, NewHistory).

new_command(o, _, []).
new_command(o, Term, History) :- 
	out(Term, History, NewTerm, NewHistory),
	browse(NewTerm, NewHistory).


next(Term, [H|History], NewTerm, NewHistory) :-
	H = (Answer, Previous, [NewTerm|Next]),
	Parent = (Answer, [Term|Previous], Next),
	NewHistory = [Parent|History].

next(Term, History, Term, History) :-
	History = [H|_],
	H = (_, _, []),
	write('Term dont have next brother'), 
	nl.

prev(Term, [H|History], NewTerm, NewHistory) :-
	H = (Answer, [NewTerm|Previous], Next),
	Parent = (Answer,Previous, [Term|Next]),
	NewHistory = [Parent|History].
    
prev(Term, History, Term, History) :-
	History = [H|_],
	H = (_, [], _),
	write('Term dont have previous brother'), 
	nl.

in(Term, History, Term, History) :-
	Term =.. [Answer],  
	write('This is last term in this clause'), 
	nl.

in(Term, History, NewTerm, NewHistory) :-
	Term =.. [Answer, NewTerm|Next],
	H = (Answer, [], Next),
	NewHistory = [H|History].

out(Term, [Parent|NewHistory], NewTerm, NewHistory) :-
	Parent = (Answer, Previous, Next),
	reverse(Previous, Previous1),
	append(Previous1, [Term|Next], Children),
	NewTerm =.. [Answer|Children].
