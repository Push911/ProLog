:- module(reader, [rd/2,program/3]).

rd(Tokens, AST) :- 
	program(AST, Tokens, []).

program([]) --> [].
program([Head|Tail]) -->
    instruction(Head),
    [separator(';')],
    program(Tail).

instruction(assign(File, Expression)) --> 
    [file(File)],
    [separator(':=')],
    expression(Expression).

instruction(read(File)) -->
    [key(read)],
    [file(File)].

instruction(write(E)) -->
    [key(write)],
    expression(E).

instruction(if(Condition, Then)) -->
    [key(if)],
    condition(Condition),
    [key(then)],
    program(Then),
    [key(fi)].

instruction(if(Condition, Then, Else)) -->
    [key(if)],
    condition(Condition),
    [key(then)],
    program(Then),
    [key(else)],
    program(Else),
    [key(fi)].

instruction(while(Condition, Do)) -->
    [key(while)],
    condition(Condition),
    [key(do)],
    program(Do),
    [key(od)].

expression(Var1 + Var2) -->
    clause(Var1),
    [separator('+')],
    expression(Var2).
    
expression(Var1 - Var2) -->
    clause(Var1),
    [separator('-')],
    expression(Var2).

expression(E) -->
    clause(E).

clause(Var1 * Var2) -->
    factor(Var1),
    [separator('*')],
    clause(Var2).

clause(Var1 / Var2) -->
    factor(Var1),
    [separator('/')],
    clause(Var2).

clause(Var1 mod Var2) -->
    factor(Var1),
    [key('mod')],
    clause(Var2).

clause(E) --> 
	factor(E).

factor(file(File)) --> 
	[file(File)].

factor(int(Int)) --> 
	[int(Int)].

factor(E) -->
    [separator('(')], 
    expression(E),
    [separator(')')].

condition((Var1;Var2)) -->
    conjunction(Var1),
    [key('or')],
    condition(Var2).

condition(Var1) -->
    conjunction(Var1).

conjunction((Var1,Var2)) -->
    conditions(Var1),
    [key('and')],
    conjunction(Var2).

conjunction(Var1) -->
    conditions(Var1).

conditions(Var1 =:= Var2) -->
    expression(Var1),
    [separator('=')],
    expression(Var2).

conditions(Var1 =\= Var2) -->
    expression(Var1),
    [separator('/=')],
    expression(Var2).

conditions(Var1 < Var2) -->
    expression(Var1),
    [separator('<')],
    expression(Var2).

conditions(Var1 > Var2) -->
    expression(Var1),
    [separator('>')],
    expression(Var2).

conditions(Var1 =< Var2) -->
    expression(Var1),
    [separator('=<')],
    expression(Var2).

conditions(Var1 >= Var2) -->
    expression(Var1),
    [separator('>=')],
    expression(Var2).

conditions(Condition) -->
    [separator('(')],
    condition(Condition),
    [separator(')')].
