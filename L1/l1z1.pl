parent(alice,bob).
parent(tom,bob).
parent(tom,lisa).
parent(bob,ann).
parent(bob,kate).
parent(kate,jame).
male(tom).
male(bob).
male(jame).
female(alice).
female(lisa).
female(ann).
female(kate).

father(X,Y) :-
        parent(X,Y),
        male(X).                       

is_father(X) :-
	father(X,_).

relatives(X,Y) :-
	parent(X,Y);
	brother(X,Y);
	sister(X,Y);
	parent(Y,X).

son(X,Y) :-
	male(X),
	parent(Y,X).

is_son(X) :-
	son(X,_).

mother(X,Y) :-
        parent(X,Y),
        female(X).            

is_mother(X) :-
	mother(X,_).	

sister(X,Y) :-
        parent(Z,X),
        parent(Z,Y),
        female(X),
        not(X=Y).


brother(X,Y) :-
        parent(Z,X),
        parent(Z,Y),
        male(X),
        not(X=Y).


uncle(X,Y) :-
        parent(Z,Y),
	male(X),
        brother(X,Z).                        

aunt(X,Y) :-
        parent(Z,Y),
	female(X),
        sister(X,Z). 

diff(X,Y) :-
	X \= Y.
       
