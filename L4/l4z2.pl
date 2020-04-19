side(X, Y, List) :- onSide(X, Y, List).
side(X, Y, List) :- onSide(Y, X, List).
onSide(H, H1, [H | [H1 | _]]).
onSide(H, H1, [_ | Tail]) :- onSide(H, H1, Tail).

question(Things,Who) :-
	Things = 
	[
		house(1, _, _, _, _, _),
		house(2, _, _, _, _, _),
		house(3, _, _, _, _, _),
		house(4, _, _, _, _, _),
		house(5, _, _, _, _, _)
	],
	member( house( 1, _, norwegian, _, _, _), Things),
	member( house( _, red, english, _, _, _), Things),
	onSide(house( _, green, _, _, _, _), house(_, white, _, _, _, _), Things),
	member( house( _, _, dane, _, tea, _), Things),
	side( house( _, _, _, _, _, light), house(_, _, _, cat, _, _), Things),
	member( house( _, yellow, _, _, _, cigars), Things),
	member( house( _, _, german, _, _, ciggarete), Things),
	member( house( 3, _, _, _, milk, _), Things),
	side( house( _, _, _, _, water, _), house(_, _, _, _, _, light), Things),
	member( house( _, _, _, bird, _, unfiltered), Things),
	member( house( _, _, swede, dog, _, _), Things),	
	side( house( _, _, norwegian, _, _, _), house(_, blue, _, _, _, _), Things),
	side( house( _, _, _, horse, _, _), house(_, yellow, _, _, _, _), Things),
	member( house( _, _, _, _, beer, menthol), Things),	
	member( house( _, green, _, _, coffee, _), Things),
	member( house( _, _, Who, question, _, _), Things).
