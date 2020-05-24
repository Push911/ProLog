:- use_module(signs).
:- use_module(reader).
:- use_module(imperator).

do(FileName) :-
    open(FileName, read, Str),
    scanner(Str, Symbol), !,
    close(Str),
    program(AST, Symbol, []),
    interpreter(AST).
