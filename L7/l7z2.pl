split(InputList, Left, Right) :- 
	freeze(InputList, 
	(InputList = [Head|List] ->  
	(Left = [Head|Tail],   
	split(List, Right, Tail));
	(Left = [], 
	Right = []))).
