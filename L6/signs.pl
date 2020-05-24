:- module(signs, [scanner/2, tokenize/2]).

separator('+').
separator('-').
separator('*').
separator('/').
separator('<').
separator('>').
separator('=<').
separator('>=').
separator(':=').
separator('=').
separator('/=').
separator('(').
separator(')').
separator(';').

keyword('read').
keyword('write').
keyword('and').
keyword('or').
keyword('mod').
keyword('then').
keyword('else').
keyword('if').
keyword('fi').
keyword('while').
keyword('do').
keyword('od').


main :-
    open('ex1.prog', read, String),
    scanner(String, Symbol),
    writeq(Symbol),
    !, close(String).

scanner(String, Symbol) :-
    scan(String, [], Input),
    tokenize(Input, Symbol).

tokenize([], []).

tokenize(In, [separator(Sep)|Symbol]) :-
    separator(Sep),
    atom_chars(Sep, SepChr),
    append(SepChr, In1, In),
    tokenize(In1, Symbol).
    
tokenize(In, [key(Key)|Symbol]) :-
    keyword(Key),
    atom_chars(Key, KeyChr),
    append(KeyChr, In1, In),
    tokenize(In1, Symbol).
    
tokenize(In, [file(Id)|Symbol]) :-
    identify(In, Id, Rem),
    Id \= '',
    tokenize(Rem, Symbol).
    
tokenize(In, [int(Int)|Symbol]) :-
    get_integer(In, Int, Rem),
    tokenize(Rem, Symbol).
    
tokenize([Head|Xs], Symbol) :-
    write('Unexpected char: "'), write(Head), write('"'), nl,
    tokenize(Xs, Symbol).

get_integer(In, Ret, Rem) :-
    get_integer(In, [], Ret, Rem).
    
get_integer([], Acc, Ret, []) :-
    reverse(Acc, List),
    atom_chars(Number, List),
    atom_number(Number, Ret).
    
get_integer([Head|Tail], Acc, Ret, Rem) :-
    char_type(Head, digit),
    get_integer(Tail, [Head|Acc], Ret, Rem).
    
get_integer(In, Acc, Ret, In) :-
    In = [Head|_],
    \+ char_type(Head, upper), 
    Acc \= [],
    reverse(Acc, List),
    atom_chars(Number, List),
    atom_number(Number, Ret).
    
nextchar(_, Acc, end_of_file, Input) :- 
	!, reverse(Acc, Input).

nextchar(String, Acc, '\n' , Input) :- 
	!, scan(String, Acc, Input).

nextchar(String, Acc, '\t' , Input) :- 
	!, scan(String, Acc, Input).

nextchar(String, Acc, ' ' , Input) :- 
	!, scan(String, Acc, Input).

nextchar(String, Acc, C, Input) :- 
	scan(String, [C|Acc], Input).
	
identify(In, Ret, Rem) :-
    identify(In, [], Ret, Rem).
    
identify([], Acc, Ret, []) :-
    Acc \= [],
    reverse(Acc, List),
    atom_chars(Ret, List).
    
identify([Head|Tail], Acc, Ret, Rem) :-
    char_type(Head, upper),
    identify(Tail, [Head|Acc], Ret, Rem).
    
identify(In, Acc, Ret, In) :-
    In = [Head|_],
    \+ char_type(Head, upper), 
    Acc \= [],
    reverse(Acc, List),
    atom_chars(Ret, List).
    

scan(String, Acc, Input) :- 
    get_char(String, Char),
    nextchar(String, Acc, Char, Input).
