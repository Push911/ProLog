:- use_module(signs).
:- use_module(reader).

main :-
    open('ex1.prog', read, String),
    scanner(String, Symbol),
    !, close(String),
    program(AST, Symbol, []),
    write(AST).
