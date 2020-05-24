:- module(imperator, [interpreter/1]).

interpreter(Instruction) :-
	interpreter(Instruction, []).

interpreter([], _).

interpreter([read(File) | Instruction], Association) :- 
	!, read(Answer),
	integer(Answer),
	substitute(Association, File, Answer, Association1),
	interpreter(Instruction, Association1).
	
interpreter([write(Clause) | Instruction], Association) :- 
	!, value(Clause, Association, Answer),
	write(Answer), nl,
	interpreter(Instruction, Association).
	
interpreter([assign(File, Clause) | Instruction], Association) :- 
	!, value(Clause, Association, Answer),
	substitute(Association, File, Answer, Association1),
	interpreter(Instruction, Association1).
	
interpreter([if(Val1, Val2) | Instruction], Association) :-
	!, interpreter([if(Val1, Val2, []) | Instruction], Association).
	
interpreter([if(Val1, P1, P2) | Instruction], Association) :- 
	!, (true(Val1, Association) ->  append(P1, Instruction, Next);
	append(P2, Instruction, Next)),
	interpreter(Next, Association).
	
interpreter([while(Val1, Val2) | Instruction], Association) :- 
	!, append(Val2, [while(Val1, Val2)], Next),
	interpreter([if(Val1, Next) | Instruction], Association).

substitute([], File, Answer, [File = Answer]).

substitute([File = _ | Association], File, Answer, [File = Answer | Association]) :- !.

substitute([File1 = Value1 | Association1], File, Answer, [File1 = Value1 | ASOC2]) :-
	substitute(Association1, File, Answer, ASOC2).

pobierz([File = Answer | _], File, Answer) :- !.

pobierz([_ | Association], File, Answer) :-
	pobierz(Association, File, Answer).

value(int(Answer), _, Answer).
value(file(File), Association, Answer) :-
	pobierz(Association, File, Answer).
	
value(Value1+Value2, Association, Answer) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer is Answer1+Answer2.
	
value(Value1-Value2, Association, Answer) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer is Answer1-Answer2.
	
value(Value1*Value2, Association, Answer) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer is Answer1*Answer2.
	
value(Value1/Value2, Association, Answer) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer2 =\= 0,
	Answer is Answer1 div Answer2.
	
value(Value1 mod Value2, Association, Answer) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer2 =\= 0,
	Answer is Answer1 mod Answer2.

true(Value1 =:= Value2, Association) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer1 =:= Answer2.
	
true(Value1 =\= Value2, Association) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer1 =\= Answer2.
	
true(Value1 < Value2, Association) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer1 < Answer2.
	
true(Value1 > Value2, Association) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer1 > Answer2.
	
true(Value1 >= Value2, Association) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer1 >= Answer2.
	
true(Value1 =< Value2, Association) :-
	value(Value1, Association, Answer1),
	value(Value2, Association, Answer2),
	Answer1 =< Answer2.
	
true((Value1, Value2), Assoc) :-
	true(Value1, Assoc),
	true(Value2, Assoc).
	
true((Value1; Value2), Assoc) :-
	(   true(Value1, Assoc), !;   
	true(Value2, Assoc)).
